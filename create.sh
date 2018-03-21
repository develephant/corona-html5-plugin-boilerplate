#!/bin/sh

PLUGIN_NAME=$1
PLUGIN_DIR=$2

TPL_FILES=./plugin
TPL_NAME='myplugin'

clear

if [ ! -e $TPL_FILES ];then
  echo 'Run create.sh from inside the boilerplate directory!'
  exit 1
fi

if [ -e $PLUGIN_DIR ];then
  echo 'Plugin directory already exists!'
  exit 1
fi

echo "Creating Coronium HTML5 Plugin ${PLUGIN_NAME}..."

# create directory
mkdir -p $PLUGIN_DIR

# copy template files
cp -R $TPL_FILES/* $PLUGIN_DIR

# rename files
mv ${PLUGIN_DIR}/${TPL_NAME}_js.js ${PLUGIN_DIR}/${PLUGIN_NAME}_js.js
mv ${PLUGIN_DIR}/${TPL_NAME}.lua ${PLUGIN_DIR}/${PLUGIN_NAME}.lua

# replace internal strings
sed -i '' "s/$TPL_NAME/$PLUGIN_NAME/g" ${PLUGIN_DIR}/${PLUGIN_NAME}_js.js
sed -i '' "s/$TPL_NAME/$PLUGIN_NAME/g" ${PLUGIN_DIR}/${PLUGIN_NAME}.lua
sed -i '' "s/$TPL_NAME/$PLUGIN_NAME/g" ${PLUGIN_DIR}/main.lua

echo "Corona HTML5 Plugin is ready at ${PLUGIN_DIR}"