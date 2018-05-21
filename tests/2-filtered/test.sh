#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${DIR}/../env.sh"

apk_path="${DIR}/../file.apk"
fingerprint='SHA-1'

print-apk-signature "$apk_path" "$fingerprint"
