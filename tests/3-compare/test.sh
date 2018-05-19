#!/usr/bin/env bash

keytool_HOME='/c/PortableApps/Java/bin'
PATH="${keytool_HOME}:${PATH}"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATH="${DIR}/../../bin:${PATH}"

apk_path_1="${DIR}/../file.apk"
apk_path_2="${DIR}/../file.apk"

compare-apk-signatures "$apk_path_1" "$apk_path_2"
