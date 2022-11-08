#!/bin/bash

# modified to put it in dist directory

TARGET_BROWSER=$1
[ -z $TARGET_BROWSER ] && echo "Usage: ./packer.sh [chrome|firefox]" && exit 1

TARGET_DIR="dist"
[ -d $TAGEET_DIR ] || mkdir $TARGET_DIR

cp $TARGET_BROWSER.manifest.json manifest.json
zip -r $TARGET_BROWSER.tusk.zip build/ assets/icons/exported/ assets/other/ dll/ popup.html options.html manifest.json

rm -rf ${TARGET_DIR}/demo-$TARGET_BROWSER
mkdir -p ${TARGET_DIR}/demo-$TARGET_BROWSER
mv $TARGET_BROWSER.tusk.zip ${TARGET_DIR}/demo-$TARGET_BROWSER
cd ${TARGET_DIR}/demo-$TARGET_BROWSER
unzip *
cd ..
echo "Files packed to ${TARGET_DIR}/$TARGET_BROWSER.tusk.zip.  Verify the build in ${TARGET_DIR}/demo-$TARGET_BROWSER"
