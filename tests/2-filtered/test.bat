@echo off

call "%~dp0..\env.bat"

set apk_path="%~dp0..\file.apk"
set fingerprint=SHA-1

call print-apk-signature %apk_path% %fingerprint%

if defined CMD_INITIATED_FROM_EXPLORER (
  echo.
  pause
)
