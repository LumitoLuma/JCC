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
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b)
echo    [javac] unzipfile.java → unzipfile.class
javac unzipfile.java
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b)
echo      [csc] addtopath.cs → addtopath.exe
csc addtopath.cs /nologo
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b)
popd
echo.
echo --- 'utils' directory successfully compiled
timeout /nobreak 1 >NUL 2>NUL
echo.
echo --- Downloading files...
md binaries >NUL 2>NUL
pushd utils
echo.
java downloadfile https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip apache-maven-3.6.3-bin.zip ..\binaries\
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b)
java downloadfile https://services.gradle.org/distributions/gradle-6.4.1-bin.zip  gradle-6.4.1-bin.zip ..\binaries\
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b)
java downloadfile https://downloads.apache.org/ant/binaries/apache-ant-1.10.8-bin.zip apache-ant-1.10.8-bin.zip ..\binaries\
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b)
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
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b)
java unzipfile gradle-6.4.1-bin.zip
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b)
java unzipfile apache-ant-1.10.8-bin.zip
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b)
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
for /d %%i in (apache-maven-3.6.3\*.*) do @xcopy /s /e /y "apache-maven-3.6.3\*.*" "..\..\JCC\maven\"
popd
echo.
pushd binaries\apache-ant-1.10.8-bin
for /d %%i in (apache-ant-1.10.8\*.*) do @xcopy /s /e /y "apache-ant-1.10.8\*.*" "..\..\JCC\ant\"
popd
echo.
pushd binaries\gradle-6.4.1-bin
for /d %%i in (gradle-6.4.1\*.*) do @xcopy /s /e /y "gradle-6.4.1\*.*" "..\..\JCC\gradle\"
popd
echo.
echo --- Files successfully copied to preparation folder
echo.
timeout /nobreak 1 >NUL 2>NUL
echo --- Copying files to installation directory...
echo.
md %AppData%\JCC >NUL 2>NUL
timeout /nobreak 1 >NUL 2>NUL
call xcopy /S JCC %AppData%\JCC
echo.
echo --- Files successfully copied to installation directory
echo.
timeout /nobreak 1 >NUL 2>NUL
echo | set /p message="--- Adding bin folders to PATH..."
pushd utils
call addtopath %AppData%\JCC\ant\bin
call addtopath %AppData%\JCC\gradle\bin
call addtopath %AppData%\JCC\maven\bin
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b)
echo  Done!
echo.
popd
timeout /nobreak 1 >NUL 2>NUL
echo | set /p message2="--- Cleaning preparation files..."
rd /s /q binaries >NUL 2>NUL
rd /s /q binaries >NUL 2>NUL
rd /s /q JCC >NUL 2>NUL
rd /s /q JCC >NUL 2>NUL
if ERRORLEVEL == 1 (echo. && echo Build error. Process aborted. && popd && exit /b)
echo  Done!
echo.
timeout /nobreak 1 >NUL 2>NUL
echo --- Installation finished! Enjoy JCC! Programs will be available after restarting the console.
timeout /nobreak 1 >NUL 2>NUL
exit /b