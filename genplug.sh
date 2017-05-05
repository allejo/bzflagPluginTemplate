#!/bin/bash

if [ "$#" -lt 1 ]
then
    echo "sh genplug.sh <plugin name> <enable bztoolkit (true|false)>"
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
rm *.bak

git init

if [ "$2" = "true" ]
then
    git submodule add https://github.com/allejo/bztoolkit.git

    # A bzToolkit requirement will not work on Windows, so remove those files
    rm "$pluginName.def" "$pluginName.sln" "$pluginName.vcxproj" "$pluginName.vcxproj.filters"

    sed -i.bak 's/\README\.md\ \\/README.md/g' "Makefile.am"
    sed -i.bak /$pluginName\.def/d "Makefile.am"
    sed -i.bak /$pluginName\.sln/d "Makefile.am"
    sed -i.bak /$pluginName\.vcxproj/d "Makefile.am"
    sed -i.bak /$pluginName\.vcxproj.filters/d "Makefile.am"
fi

rm *.bak
git add .