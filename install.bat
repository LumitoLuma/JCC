@echo off
endlocal
chcp 65001 >NUL
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
java downloadfile https://dl.lumito.net/public/repos/JCC/gradle-6.5-bin.zip  gradle-6.5-bin.zip ..\binaries\
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
java unzipfile gradle-6.5-bin.zip
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
pushd binaries\apache-ant-1.10.8-bin
call xcopy /s /y "apache-ant-1.10.8" "..\..\JCC\ant\"
popd
echo.
pushd binaries\gradle-6.5-bin
call xcopy /s /y "gradle-6.5" "..\..\JCC\gradle\"
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
