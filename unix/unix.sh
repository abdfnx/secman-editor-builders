#!/bin/bash

v=$(curl --silent "https://api.github.com/repos/scmn-dev/editor/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
releases_api_url=https://github.com/scmn-dev/editor/releases/download
smUrl=$releases_api_url/$v/editor

wget -P ~/.secman $smUrl

if [ -f ~/.secman/editor ]; then
    echo "Secman Editor Installed"
else
    echo "Secman Editor Installation Failed"
fi
