#!/usr/bin/env dash
########################################################################

DC=`which dmd`
LIBS="-I../elementary -I../eina -I../eina/eina -I../evas -I../ecore \
      -I../edje"
LINK="-L-lelementary -L-leina -L-lm -L-lpthread -L-lrt"

echo "$DC $1 $LIBS $LINK"
$DC $LIBS $LINK $1
