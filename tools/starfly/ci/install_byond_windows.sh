#!/usr/bin/env bash
set -e
source dependencies.sh
echo "Installing BYOND version $BYOND_MAJOR.$BYOND_MINOR"
cp -v "tools/starfly/byond/$BYOND_MAJOR.${BYOND_MINOR}_byond.zip" C:/byond.zip
