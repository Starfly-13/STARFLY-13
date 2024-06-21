#!/usr/bin/env bash
set -euo pipefail

# if BYOND_MAJOR is not defined
if [ -z "${BYOND_MAJOR+x}" ]; then
    # source all of the dependency defines
    source dependencies.sh
fi

# if the proper version of BYOND is already installed
if [ -d "${HOME}/BYOND/byond/bin" ] && grep -Fxq "${BYOND_MAJOR}.${BYOND_MINOR}" $HOME/BYOND/version.txt;
then
    # tell the user that we're using the cached version
    echo "Using cached BYOND ${BYOND_MAJOR}.${BYOND_MINOR}"
else
    # tell the user that we're installing BYOND
    echo "Setting up BYOND ${BYOND_MAJOR}.${BYOND_MINOR}"
    # this is the BYOND archive that we will install
    BYOND_ZIP="tools/starfly/byond/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip"
    # if the archive doesn't exist
    if [ ! -f ${BYOND_ZIP} ]; then
        # tell the user BYOND is out of date
        echo "${BYOND_ZIP} not found; cannot setup BYOND"
        exit 1
    fi
    # remove any prior installation and set up a fresh directory
    rm -rf "${HOME}/BYOND"
    mkdir -p "${HOME}/BYOND"
    # copy BYOND from our repo
    cp -v "${BYOND_ZIP}" "${HOME}/BYOND/byond.zip"
    # unzip and install BYOND
    cd "${HOME}/BYOND"
    unzip byond.zip
    rm byond.zip
    cd byond
    make here
    # record the version that we installed for posterity
    echo "${BYOND_MAJOR}.${BYOND_MINOR}" > "${HOME}/BYOND/version.txt"
    # change back to our home directory
    cd "${HOME}"
fi
