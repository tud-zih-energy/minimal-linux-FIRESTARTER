#!/bin/sh

set -e

. ../../common.sh

echo "Removing old 'FIRESTARTER' artifacts. This may take a while."
rm -rf $DEST_DIR
mkdir -p $DEST_DIR/opt/$BUNDLE_NAME
mkdir -p $DEST_DIR/usr/bin

echo "cd $DEST_DIR"

cd $DEST_DIR

cp $MAIN_SRC_DIR/work/overlay/$BUNDLE_NAME/FIRESTARTER/FIRESTARTER opt/$BUNDLE_NAME/FIRESTARTER

chmod +rx opt/$BUNDLE_NAME/FIRESTARTER

cd $DEST_DIR/usr/bin

ln -s ../../opt/$BUNDLE_NAME/FIRESTARTER FIRESTARTER

# With '--remove-destination' all possibly existing soft links in
# '$OVERLAY_ROOTFS' will be overwritten correctly.
cp -r --remove-destination $DEST_DIR/* \
  $OVERLAY_ROOTFS

echo "Bundle 'FIRESTARTER' has been installed."

cd $SRC_DIR
