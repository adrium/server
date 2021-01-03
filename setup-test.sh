#!/bin/sh

NCDATA=/mnt/ncdata
NCUSER=admin

NCTEST=$NCDATA/$NCUSER/files

DIR=$NCTEST/Tests/valid
mkdir -p $DIR
echo '# Valid links' > $DIR/README.md
ln -s ../../Photos $DIR/photos
ln -s ../../Photos/Library.jpg $DIR/file.jpg

DIR=$NCTEST/Tests/invalid
mkdir -p $DIR
echo '# Test for invalid link target' > $DIR/README.md
ln -s /invalid $DIR/link1
ln -s /tmp/invalid $DIR/link2

DIR=$NCTEST/Tests/outside
mkdir -p $DIR
mkdir /tmp/hello
echo '# Test for link target outside the user folder' > $DIR/README.md
echo '# Hello World' > /tmp/hello/README.md
ln -s /tmp/hello $DIR/link

DIR=$NCTEST/Tests/cyclic
mkdir -p $DIR
echo '# Test link pointing to parent' > $DIR/README.md
mkdir -p $DIR/directory/files
ln -s ../../directory $DIR/directory/files/parent
