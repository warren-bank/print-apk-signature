#!/usr/bin/env bash

keytool_HOME='/c/PortableApps/Java/bin'
PATH="${keytool_HOME}:${PATH}"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATH="${DIR}/../../bin:${PATH}"

apk_path="${DIR}/../file.apk"
fingerprint='SHA1'

print-apk-signature "$apk_path" "$fingerprint"
