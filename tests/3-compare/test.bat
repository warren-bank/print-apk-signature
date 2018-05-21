@echo off

call "%~dp0..\env.bat"

set apk_path_1="%~dp0..\file.apk"
set apk_path_2="%~dp0..\file.apk"

call compare-apk-signatures %apk_path_1% %apk_path_2%

if defined CMD_INITIATED_FROM_EXPLORER (
  echo.
  pause
)
