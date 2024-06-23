@echo off
rem This file is generated from main.pbat, all edits will be lost
set PATH=C:\mingw1120_64\bin;C:\Program Files\7-Zip;C:\Program Files\Meson;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja;C:\Program Files (x86)\Android\android-sdk\cmake\3.22.1\bin;C:\Program Files\CMake\bin;C:\postgresql-14\bin;C:\qt\6.7.1\mingw1120_64\bin;C:\mysql-8.2.0-winx64\lib;C:\mysql-8.2.0-winx64\bin;%PATH%
if exist "C:\Program Files\Git\mingw32\bin\curl.exe" set CURL=C:\Program Files\Git\mingw32\bin\curl.exe
if exist "C:\Program Files\Git\mingw64\bin\curl.exe" set CURL=C:\Program Files\Git\mingw64\bin\curl.exe
if exist "C:\Windows\System32\curl.exe" set CURL=C:\Windows\System32\curl.exe
if not defined CURL (
echo CURL not found
exit /b
)
if exist C:\mingw1120_64\bin\gcc.exe goto mingw1120_end
pushd %~dp0
    if not exist x86_64-11.2.0-release-posix-seh-rt_v9-rev3.7z "%CURL%" -L -o x86_64-11.2.0-release-posix-seh-rt_v9-rev3.7z https://github.com/cristianadam/mingw-builds/releases/download/v11.2.0-rev3/x86_64-11.2.0-release-posix-seh-rt_v9-rev3.7z
    7z x -y -oC:\ x86_64-11.2.0-release-posix-seh-rt_v9-rev3.7z
    move C:\mingw64 C:\mingw1120_64
popd
:mingw1120_end
where gcc || echo gcc not found
where qmake || echo qmake not found
where cmake || echo cmake not found
where ninja || echo ninja not found
where libpq.dll || echo libpq.dll not found
where libmysql.dll || echo libmysql.dll not found
if exist C:\Qt\6.7.1\mingw1120_64\bin\qmake.exe goto qt671_end
rmdir /s /q "C:\Program Files\PostgreSQL" || echo 1 > NUL
rmdir /s /q "C:\Program Files\MySQL" || echo 1 > NUL
pushd %~dp0
    if not exist qtbase-everywhere-src-6.7.1.zip "%CURL%" -L -o qtbase-everywhere-src-6.7.1.zip https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtbase-everywhere-src-6.7.1.zip
    if not exist qtbase-everywhere-src-6.7.1 7z x -y qtbase-everywhere-src-6.7.1.zip
    pushd qtbase-everywhere-src-6.7.1
        cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=C:/Qt/6.7.1/mingw1120_64 -DQT_QMAKE_TARGET_MKSPEC=win32-g++ -DQT_BUILD_TESTS=FALSE -DQT_BUILD_EXAMPLES=FALSE -DFEATURE_system_zlib=OFF .
        ninja
        ninja install
        copy /y "C:\mingw1120_64\bin\libstdc++-6.dll" C:\Qt\6.7.1\mingw1120_64\bin
        copy /y C:\mingw1120_64\bin\libgcc_s_seh-1.dll C:\Qt\6.7.1\mingw1120_64\bin
        copy /y C:\mingw1120_64\bin\libwinpthread-1.dll C:\Qt\6.7.1\mingw1120_64\bin
    popd
popd
:qt671_end
if exist C:\qt\6.7.1\mingw1120_64\plugins\sqldrivers\qsqlmysql.dll goto mysql820_end
if exist C:\mysql-8.2.0-winx64\bin\mysql.exe goto mysql820_end
pushd %~dp0
    if not exist mysql-8.2.0-winx64.zip "%CURL%" -L -o mysql-8.2.0-winx64.zip https://cdn.mysql.com/Downloads/MySQL-8.2/mysql-8.2.0-winx64.zip
    7z x -y -oC:\ mysql-8.2.0-winx64.zip
popd
:mysql820_end
if exist C:\qt\6.7.1\mingw1120_64\plugins\sqldrivers\qsqlmysql.dll goto qsqlmysql671_end
where gcc || echo gcc not found
where qmake || echo qmake not found
where cmake || echo cmake not found
where ninja || echo ninja not found
where libpq.dll || echo libpq.dll not found
where libmysql.dll || echo libmysql.dll not found
pushd %~dp0
    if not exist "build-qsqlmysql" mkdir "build-qsqlmysql"
    if not exist qtbase-everywhere-src-6.7.1.zip "%CURL%" -L -o qtbase-everywhere-src-6.7.1.zip https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtbase-everywhere-src-6.7.1.zip
    if not exist qtbase-everywhere-src-6.7.1 7z x -y qtbase-everywhere-src-6.7.1.zip
    pushd build-qsqlmysql
        cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="C:\Qt\6.7.1\mingw1120_64" -DMySQL_INCLUDE_DIR="C:\mysql-8.2.0-winx64\include" -DMySQL_LIBRARY="C:\mysql-8.2.0-winx64\lib\libmysql.lib" ..\qtbase-everywhere-src-6.7.1\src\plugins\sqldrivers
        cmake --build .
        cmake --install .
        copy /y C:\mysql-8.2.0-winx64\lib\libmysql.dll C:\Qt\6.7.1\mingw1120_64\bin
        copy /y C:\mysql-8.2.0-winx64\bin\libssl-3-x64.dll C:\Qt\6.7.1\mingw1120_64\bin
        copy /y C:\mysql-8.2.0-winx64\bin\libcrypto-3-x64.dll C:\Qt\6.7.1\mingw1120_64\bin
    popd
popd
:qsqlmysql671_end
if exist C:\postgresql-14\bin\psql.exe goto psql1412_end
if exist C:\qt\6.7.1\mingw1120_64\plugins\sqldrivers\qsqlpsql.dll goto psql1412_end
pushd %~dp0
    if not exist postgresql-14.12-2-windows-x64-binaries.zip "%CURL%" -L -o postgresql-14.12-2-windows-x64-binaries.zip https://get.enterprisedb.com/postgresql/postgresql-14.12-2-windows-x64-binaries.zip
    7z x -y -oC:\ postgresql-14.12-2-windows-x64-binaries.zip
    move C:\pgsql C:\postgresql-14
popd
:psql1412_end
if exist C:\qt\6.7.1\mingw1120_64\plugins\sqldrivers\qsqlpsql.dll goto qsqlpsql671_end
where gcc || echo gcc not found
where qmake || echo qmake not found
where cmake || echo cmake not found
where ninja || echo ninja not found
where libpq.dll || echo libpq.dll not found
where libmysql.dll || echo libmysql.dll not found
set PostgreSQL_ROOT=C:\postgresql-14
pushd %~dp0
    if not exist "build-qsqlpsql" mkdir "build-qsqlpsql"
    if not exist qtbase-everywhere-src-6.7.1.zip "%CURL%" -L -o qtbase-everywhere-src-6.7.1.zip https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtbase-everywhere-src-6.7.1.zip
    if not exist qtbase-everywhere-src-6.7.1 7z x -y qtbase-everywhere-src-6.7.1.zip
    pushd build-qsqlpsql
        cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="C:\Qt\6.7.1\mingw1120_64" ..\qtbase-everywhere-src-6.7.1\src\plugins\sqldrivers
        cmake --build .
        cmake --install .
        copy /y C:\postgresql-14\bin\libpq.dll C:\Qt\6.7.1\mingw1120_64\bin
        copy /y C:\postgresql-14\bin\libssl-1_1-x64.dll C:\Qt\6.7.1\mingw1120_64\bin
        copy /y C:\postgresql-14\bin\libcrypto-1_1-x64.dll C:\Qt\6.7.1\mingw1120_64\bin
        copy /y C:\postgresql-14\bin\libintl-9.dll C:\Qt\6.7.1\mingw1120_64\bin
        copy /y C:\postgresql-14\bin\libiconv-2.dll C:\Qt\6.7.1\mingw1120_64\bin
    popd
popd
:qsqlpsql671_end
gcc -dumpversion
qmake -v