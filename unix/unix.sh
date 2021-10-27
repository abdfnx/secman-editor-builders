#!/bin/bash

loc=~/.secman/editor

v=$(curl --silent "https://api.github.com/repos/scmn-dev/editor/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
releases_api_url=https://github.com/scmn-dev/editor/releases/download
smUrl=$releases_api_url/$v/editor

wget -O $loc $smUrl

if [ -f $loc ]; then
    echo "Secman Editor Installed"
else
    echo "Secman Editor Installation Failed"
fi
