#!/bin/bash

if [ "$#" -lt 1 ]
then
    echo "sh genplug.sh <plugin name> <enable bztoolkit (true|false)>"
    exit
fi

pluginName=$1
template=SAMPLE_PLUGIN

mv "$template.def" "$pluginName.def"

sed -i.bak s/$template/$1/g "$pluginName.def"
sed -i.bak s/$template/$1/g "Makefile.am"

rm "README.md"

touch "LICENSE.md"
touch "README.$pluginName.txt"
touch "README.md"

rm -rf .git
rm genplug.sh
rm *.bak

git init

if [ "$2" = "true" ]
then
    git submodule add https://github.com/allejo/bztoolkit.git
fi

git add .