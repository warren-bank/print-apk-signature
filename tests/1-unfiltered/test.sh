#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${DIR}/../env.sh"

apk_path="${DIR}/../file.apk"

print-apk-signature "$apk_path"
