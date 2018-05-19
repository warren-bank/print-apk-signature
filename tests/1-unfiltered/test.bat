@echo off

call "C:\PortableApps\Java\env.bat"

set unzip_HOME=C:\PortableApps\7-Zip\App\7-Zip64
set PATH=%unzip_HOME%;%PATH%

set PATH=%~dp0..\..\bin;%PATH%

set apk_path="%~dp0..\file.apk"

call print-apk-signature %apk_path%

echo.
pause
