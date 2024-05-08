# syntax=docker/dockerfile:1
FROM beestation/byond:515.1616 as base

# Install a MariaDB development package for the shared library
FROM base as mariadb_library
RUN dpkg --add-architecture i386 \
    && apt-get update \
	&& apt-get install -y --no-install-recommends \
    libmariadb-dev:i386 \
    && rm -rf /var/lib/apt/lists/*

# Install the tools needed to compile our rust dependencies
FROM base as rust-build
ENV PKG_CONFIG_ALLOW_CROSS=1 \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH
WORKDIR /build
COPY dependencies.sh .
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    curl ca-certificates gcc-multilib \
    g++-multilib libc6-i386 zlib1g-dev:i386 \
    libssl-dev:i386 pkg-config:i386 git \
    && /bin/bash -c "source dependencies.sh \
    && curl https://sh.rustup.rs | sh -s -- -y -t i686-unknown-linux-gnu --no-modify-path --profile minimal --default-toolchain \$RUST_VERSION" \
    && rm -rf /var/lib/apt/lists/*

# Build rust-g
FROM rust-build as rustg
RUN git init \
    && git remote add origin https://github.com/tgstation/rust-g \
    && /bin/bash -c "source dependencies.sh \
    && git fetch --depth 1 origin \$RUST_G_VERSION" \
    && git checkout FETCH_HEAD \
    && cargo build --release --features all --target i686-unknown-linux-gnu

# Build auxmos
FROM rust-build as auxmos
RUN git init \
    && /bin/bash -c "source dependencies.sh \
    && git remote add origin \$AUXMOS_REPO \
    && git fetch --depth 1 origin \$AUXMOS_VERSION" \
    && git checkout FETCH_HEAD \
    && cargo rustc --target=i686-unknown-linux-gnu --release --features all_reaction_hooks,katmos -- -C target-cpu=native

# Install nodejs which is required to deploy Shiptest
# NOTE: See: https://github.com/nodesource/distributions/discussions/1639
FROM base as node
COPY dependencies.sh .
RUN apt-get update \
    && apt-get install curl -y \
    && /bin/bash -c "source dependencies.sh \
    && curl -fsSL https://deb.nodesource.com/setup_\$NODE_VERSION.x | bash -" \
    && apt-get install -y nodejs

# Build TGUI, tgfonts, and the dmb
FROM node as dm-build
ENV TG_BOOTSTRAP_NODE_LINUX=1
WORKDIR /dm-build
COPY . .
# Required to satisfy our compile_options
COPY --from=auxmos /build/target/i686-unknown-linux-gnu/release/libauxmos.so /dm-build/auxtools/libauxmos.so
RUN tools/build/build \
    && tools/deploy.sh /deploy \
    && apt-get autoremove curl -y \
    && rm -rf /var/lib/apt/lists/*

# Build the final starfly13 container image
FROM base
# create an ss13 user and group for the container
RUN groupadd \
	--gid 1001 \
	ss13
RUN useradd \
	--gid 1001 \
	--no-create-home \
	--shell /bin/bash \
	--uid 1001 \
	ss13
USER ss13
# work in the /shiptest directory
WORKDIR /shiptest
# copy the shared libraries we need to the BYOND binary directory
COPY --chown=ss13:ss13 --from=auxmos /build/target/i686-unknown-linux-gnu/release/libauxmos.so libauxmos.so
COPY --chown=ss13:ss13 --from=mariadb_library /usr/lib/i386-linux-gnu/libmariadb.so libmariadb.so
COPY --chown=ss13:ss13 --from=rustg /build/target/i686-unknown-linux-gnu/release/librust_g.so librust_g.so
# copy our build assets and execuable to our working directory
COPY --chown=ss13:ss13 --from=dm-build /deploy ./
# declare the volumes that we'd like orchestration to provide
VOLUME [ "/shiptest/config", "/shiptest/data" ]
# tell orchestration how to start the starfly13 service
ENV LD_LIBRARY_PATH="/shiptest:${LD_LIBRARY_PATH}"
ENTRYPOINT [ "DreamDaemon", "shiptest.dmb", "-port", "1337", "-trusted", "-close", "-verbose" ]
# allow connections on port 1337 when the container is started
EXPOSE 1337
