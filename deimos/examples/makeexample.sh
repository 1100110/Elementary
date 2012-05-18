#!/usr/bin/env bash
CC=`which gcc`
LIBS=`pkg-config --cflags --libs elementary`
CFLAGS="-Os -pipe -march=native -g"
OUT=`echo $1 | cut -d "." -f 1`
$CC $CFLAGS $1 -o $OUT $LIBS
