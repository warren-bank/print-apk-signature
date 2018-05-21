#!/usr/bin/env bash

__DIR="$DIR"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

keytool_HOME='/c/PortableApps/Java/bin'
PATH="${keytool_HOME}:${PATH}"

PATH="${DIR}/../bin:${PATH}"

DIR="$__DIR"
unset __DIR
