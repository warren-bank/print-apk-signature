@echo off

if [%1]==[] (
  echo Error: Filepath to 1st APK is undefined.
  exit /B 1
)

if [%2]==[] (
  echo Error: Filepath to 2nd APK is undefined.
  exit /B 1
)

set apk_path_1="%~1"
set apk_path_2="%~2"

set fingerprint=SHA-1

for /F "tokens=* delims=" %%L in ('call print-apk-signature %apk_path_1% %fingerprint%') do set apk_fingerprint_1=%%L
for /F "tokens=* delims=" %%L in ('call print-apk-signature %apk_path_2% %fingerprint%') do set apk_fingerprint_2=%%L

if defined apk_fingerprint_1 if defined apk_fingerprint_2 if "%apk_fingerprint_1%"=="%apk_fingerprint_2%" (echo EQUAL) else (echo NOT EQUAL)
