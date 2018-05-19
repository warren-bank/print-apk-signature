@echo off

call "C:\PortableApps\Java\env.bat"

set unzip_HOME=C:\PortableApps\7-Zip\App\7-Zip64
set PATH=%unzip_HOME%;%PATH%

set PATH=%~dp0..\..\bin;%PATH%

set apk_path_1="%~dp0..\file.apk"
set apk_path_2="%~dp0..\file.apk"

call compare-apk-signatures %apk_path_1% %apk_path_2%

echo.
pause
