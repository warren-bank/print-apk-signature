#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${DIR}/../env.sh"

apk_path_1="${DIR}/../file.apk"
apk_path_2="${DIR}/../file.apk"

compare-apk-signatures "$apk_path_1" "$apk_path_2"
