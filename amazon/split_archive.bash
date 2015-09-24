#!/bin/bash

#Usage: split_archive.sh INPUTFILE OUTPUT_PREFIX

INFILE=$1
OUTPUT_PREFIX=$2

DIRNAME=`dirname $OUTPUT_PREFIX`

if [ -e $DIRNAME ]; then
	echo "Error: $DIRNAME already exists"
	exit 1
fi

mkdir -p $DIRNAME

LINES=250000
SUFFIX_LENGTH=4

#Todo: this is totally CPU bound by the "parse_loose_json.py" step which could happen after splitting on multiple cores.
#Break this into a three-stage process. - split the compressed files to intermediate output, apply parse_loose_json in parallel, and clean up.
#On a Mac, you'll need to change this to "gzcat"
zcat $INFILE | 
python parse_loose_json.py | 
split --suffix-length=4 --lines=$LINES --filter='gzip > $FILE.gz' - $OUTPUT_PREFIX
