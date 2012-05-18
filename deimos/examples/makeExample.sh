#!/usr/bin/env bash
CC=`which gdc`
LIBS=`pkg-config --cflags --libs elementary`
CFLAGS="-Os -pipe -march=native -g"
OUT=`echo $1 | cut -d "." -f 1`

echo "$CC $CFLAGS $1 -o $OUT $LIBS"
$CC $CFLAGS $1 -o $OUT $LIBS
