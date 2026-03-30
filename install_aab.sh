#!/bin/sh

# Check argument
if [ -z "$1" ]; then
	echo "usage: ./install_aab.sh <app-bundle.aab>"
	exit 1
fi

# Generate filename
AAB_FILE=$1
APKS_FILE="${AAB_FILE}.apks"

# Check aab file
if [ ! -f "$AAB_FILE" ]; then
	echo "error: aab file $AAB_FILE not found."
	exit 1
fi

# If redundant apks file exists, delete it
if [ -f "$APKS_FILE" ]; then
	echo "info: apks file dound. deleting..."
	rm "$APKS_FILE"
	echo "info: apks file delete done..!"
fi

# Check bundle tool
BUNDLE_TOOL="./bundle-tool.jar"

if [ ! -f "$BUNDLE_TOOL" ]; then
	echo "error: bundle tool not found. please locate it as $BUNDLE_TOOL"
	exit 1
fi

# Build apks from aab for local testing
echo
echo "Building apks file..."
echo

java -jar "$BUNDLE_TOOL" build-apks \
	--local-testing \
	--bundle="$AAB_FILE" \
	--output="$APKS_FILE"

# Check if build failed
if [ $? -ne 0 ]; then
	echo "error: build apks from aab failed."
	exit 1
fi

# Build done. Intall apks file
echo
echo "Build done..! Installing..."
echo

java -jar "$BUNDLE_TOOL" install-apks \
	--apks="$APKS_FILE"

# Check if install failed
if [ $? -ne 0 ]; then
	echo "error: install apks failed."
	exit 1
fi

# Install done. Delete apks file
echo
echo "Install done..! Cleaning..."
echo

rm "$APKS_FILE"

# Done everything
echo
echo "Done..!"
echo
