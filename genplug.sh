#!/bin/bash

if [ "$#" -lt 1 ]
then
    echo "sh genplug.sh <plugin name>"
    exit
fi

pluginName=$1
template=SAMPLE_PLUGIN

mv "$template.def" "$pluginName.def"
mv "$template.sln" "$pluginName.sln"
mv "$template.vcxproj" "$pluginName.vcxproj"
mv "$template.vcxproj.filters" "$pluginName.vcxproj.filters"

sed -i.bak s/$template/$1/g "$pluginName.sln"
sed -i.bak s/$template/$1/g "$pluginName.vcxproj"
sed -i.bak s/$template/$1/g "$pluginName.vcxproj.filters"
sed -i.bak s/$template/$1/g "$pluginName.def"
sed -i.bak s/$template/$1/g "Makefile.am"

rm "README.md"

touch "LICENSE.md"
mv "README.template.md" "README.md"

rm -rf .git
rm genplug.sh

git init

rm *.bak
git add .