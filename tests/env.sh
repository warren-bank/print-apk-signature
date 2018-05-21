#!/usr/bin/env bash

source '/c/PortableApps/Java/env.sh'

__DIR="$DIR"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PATH="${DIR}/../bin:${PATH}"

DIR="$__DIR"
unset __DIR
