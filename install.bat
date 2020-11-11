@echo off
chcp 65001 >NUL
IF /I "%~1"=="version"    GOTO version
IF /I "%~1"=="/version"   GOTO version
IF /I "%~1"=="-version"   GOTO version
IF /I "%~1"=="--version"  GOTO version
IF /I "%~1"=="v"          GOTO version
IF /I "%~1"=="/v"         GOTO version
IF /I "%~1"=="-v"         GOTO version
echo ===================================================
echo  Java Compiler Colection (JCC) installation script
echo ===================================================
echo.
echo --- Compiling 'utils' directory...
pushd utils
echo.
echo    [javac] downloadfile.java → downloadfile.class
javac downloadfile.java
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b 1)
echo    [javac] unzipfile.java    → unzipfile.class
javac unzipfile.java
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b 1)
echo      [csc] addtopath.cs      → addtopath.exe
csc addtopath.cs /nologo
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b 1)
popd
echo.
echo --- 'utils' directory successfully compiled
timeout /nobreak 1 >NUL 2>NUL
echo.
echo --- Downloading files (from dl.lumito.net)...
md binaries >NUL 2>NUL
pushd utils
echo.
java downloadfile https://dl.lumito.net/public/repos/JCC/apache-maven-3.6.3-bin.zip apache-maven-3.6.3-bin.zip ..\binaries\
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
java downloadfile https://dl.lumito.net/public/repos/JCC/gradle-6.7-bin.zip  gradle-6.7-bin.zip ..\binaries\
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
java downloadfile https://dl.lumito.net/public/repos/JCC/apache-ant-1.10.8-bin.zip apache-ant-1.10.8-bin.zip ..\binaries\
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
java downloadfile https://dl.lumito.net/public/repos/JCC/refreshenv.cmd refreshenv.cmd .\
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
java downloadfile https://dl.lumito.net/public/repos/JCC/JCC.bat JCC.bat .\
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
java downloadfile https://dl.lumito.net/public/repos/JCC/help.exe help.exe .\
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
popd
echo.
echo --- Files downloaded successfully
timeout /nobreak 1 >NUL 2>NUL
echo.
echo --- Extracting compressed files...
pushd binaries
echo.
copy ..\utils\unzipfile.class >NUL
java unzipfile apache-maven-3.6.3-bin.zip
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
java unzipfile gradle-6.7-bin.zip
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
java unzipfile apache-ant-1.10.8-bin.zip
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
del unzipfile.class >NUL 2>NUL
popd
echo.
echo --- Compressed files successfully extracted
timeout /nobreak 1 >NUL 2>NUL
echo.
echo --- Copying files to preparation folder...
echo.
md JCC >NUL 2>NUL
timeout /nobreak 1 >NUL 2>NUL
pushd binaries\apache-maven-3.6.3-bin
call xcopy /s /y "apache-maven-3.6.3" "..\..\JCC\maven\"
popd
echo.
pushd binaries\gradle-6.7-bin
call xcopy /s /y "gradle-6.7" "..\..\JCC\gradle\"
popd
echo.
pushd binaries\apache-ant-1.10.8-bin
call xcopy /s /y "apache-ant-1.10.8" "..\..\JCC\ant\"
popd
echo.
echo --- Files successfully copied to preparation folder
echo.
timeout /nobreak 1 >NUL 2>NUL
echo --- Preparing JCC CLI...
echo.
pushd utils
md ..\JCC\bin >NUL 2>NUL
md ..\JCC\lib >NUL 2>NUL
echo | set /p copy1="Copying JCC.bat..."
copy /y JCC.bat ..\JCC\bin\ >NUL 2>NUL
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
echo  Done!
echo | set /p copy2="Copying help.exe..."
copy /y help.exe ..\JCC\lib\ >NUL 2>NUL
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
echo  Done!
echo.
popd
echo --- JCC CLI successfully prepared
echo.
timeout /nobreak 1 >NUL 2>NUL
echo --- Copying files to installation directory...
echo.
md %AppData%\JCC >NUL 2>NUL
timeout /nobreak 1 >NUL 2>NUL
call xcopy /s /y JCC %AppData%\JCC
echo.
echo --- Files successfully copied to installation directory
echo.
timeout /nobreak 1 >NUL 2>NUL
echo | set /p message="--- Adding bin folder to PATH..."
pushd utils
call addtopath %AppData%\JCC\bin
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
echo  Done!
echo.
popd
timeout /nobreak 1 >NUL 2>NUL
echo | set /p message2="--- Cleaning preparation files..."
rd /s /q binaries, JCC >NUL 2>NUL
del /f /q utils\*.class, utils\*.exe >NUL 2>NUL
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
echo  Done!
echo.
echo | set /p finalmsg="--- "
call utils\refreshenv.cmd
timeout /nobreak 1 >NUL 2>NUL
del /f /q utils\*.bat, utils\*.cmd >NUL 2>NUL
echo.
if ERRORLEVEL == 1 (echo. && echo Installation error. Process aborted. && popd && exit /b 1)
echo --- Installation finished! Enjoy JCC!
timeout /nobreak 1 >NUL 2>NUL
exit /b 0

:version
echo Java Compiler Collection version 1.0
echo Coded by Lumito - www.lumito.net
echo Hosted on GitHub: github.com/LumitoLuma
echo.
echo Licensed under the MIT License
echo.
echo Copyright (c) 2020 Lumito Luma
echo.
echo Permission is hereby granted, free of charge, to any person obtaining a copy
echo of this software and associated documentation files (the "Software"), to deal
echo in the Software without restriction, including without limitation the rights
echo to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
echo copies of the Software, and to permit persons to whom the Software is
echo furnished to do so, subject to the following conditions:
echo.
echo The above copyright notice and this permission notice shall be included in all
echo copies or substantial portions of the Software.
echo.
echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
echo SOFTWARE.
exit /b
