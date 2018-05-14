@echo off

if [%1]==[] (
  echo Error: Filepath to APK is undefined.
  exit /B 1
)

set apk_path="%~1"
set crt_path="META-INF/CERT.RSA"

set tmp_dir="%~dp0.\.tmp"
if exist %tmp_dir% rmdir /Q /S %tmp_dir%
mkdir %tmp_dir%

7z x -o%tmp_dir% %apk_path% %crt_path% >NUL 2>&1

set crt_path=%tmp_dir%\%crt_path%
set crt_path=%crt_path:"\"=\%
set crt_path=%crt_path:\.\=\%
set crt_path=%crt_path:/=\%

keytool -printcert -file %crt_path%

rmdir /Q /S %tmp_dir% >NUL 2>&1
