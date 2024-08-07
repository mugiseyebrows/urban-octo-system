@echo off
rem This file is generated from qt671.pbat, all edits will be lost
set PATH=C:\mingw1120_64\bin;C:\Program Files\7-Zip;C:\Program Files\Meson;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja;C:\Program Files (x86)\Android\android-sdk\cmake\3.22.1\bin;C:\Program Files\CMake\bin;C:\postgresql-14\bin;C:\qt\6.7.1\mingw1120_64\bin;C:\mysql-8.2.0-winx64\lib;C:\mysql-8.2.0-winx64\bin;C:\Program Files\Git\cmd;%PATH%
if exist "C:\Program Files\Git\mingw32\bin\curl.exe" set CURL=C:\Program Files\Git\mingw32\bin\curl.exe
if exist "C:\Program Files\Git\mingw64\bin\curl.exe" set CURL=C:\Program Files\Git\mingw64\bin\curl.exe
if exist "C:\Windows\System32\curl.exe" set CURL=C:\Windows\System32\curl.exe
if not defined CURL (
echo CURL not found
exit /b
)
if exist "C:\Program Files\Git\usr\bin\patch.exe" set PATCH=C:\Program Files\Git\usr\bin\patch.exe
if not defined PATCH (
echo PATCH not found
exit /b
)
if exist C:\mingw1120_64\bin\gcc.exe goto mingw1120_end
pushd %~dp0
    if not exist x86_64-11.2.0-release-posix-seh-rt_v9-rev3.7z "%CURL%" -L -o x86_64-11.2.0-release-posix-seh-rt_v9-rev3.7z https://github.com/cristianadam/mingw-builds/releases/download/v11.2.0-rev3/x86_64-11.2.0-release-posix-seh-rt_v9-rev3.7z
    7z x -y -oC:\ x86_64-11.2.0-release-posix-seh-rt_v9-rev3.7z
    move C:\mingw64 C:\mingw1120_64
popd
:mingw1120_end
if exist C:\Qt\6.7.1\mingw1120_64\bin\qmake.exe goto qt671_end
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
if exist C:\qt\6.7.1\mingw1120_64\bin\Qt6Svg.dll goto qtsvg671_end
if not exist qtsvg-everywhere-src-6.7.1.zip "%CURL%" -L -o qtsvg-everywhere-src-6.7.1.zip https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtsvg-everywhere-src-6.7.1.zip
if not exist qtsvg-everywhere-src-6.7.1 7z x -y qtsvg-everywhere-src-6.7.1.zip
pushd qtsvg-everywhere-src-6.7.1
    mkdir build
    pushd build
        cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="C:\Qt\6.7.1\mingw1120_64" -DCMAKE_TOOLCHAIN_FILE=C:\qt\6.7.1\mingw1120_64\lib\cmake\Qt6\qt.toolchain.cmake ..
        cmake --build .
        cmake --install .
    popd
popd
:qtsvg671_end
if exist C:\qwt\6.3.0\mingw1120_64\lib\qwt.dll goto qwt630_end
if not exist qwt (
    git clone https://git.code.sf.net/p/qwt/git qwt
    pushd qwt
        git checkout v6.3.0
    popd
)
if not exist 0001-qwt-mingw1120_64.patch "%CURL%" -L -o 0001-qwt-mingw1120_64.patch https://gist.githubusercontent.com/mugiseyebrows/b9521434ce1b8aa798615a7b0541db58/raw/9464118e04a4cb82e522a0575f2581deff8f94c6/0001-qwt-mingw1120_64.patch
if not exist 0002-qwt-no-examples.patch "%CURL%" -L -o 0002-qwt-no-examples.patch https://gist.githubusercontent.com/mugiseyebrows/a04100f99b8f1f8c6815c3903aefad96/raw/a3b9e3087d0889a882f6129a3e07d11c06d1101f/0002-qwt-no-examples.patch
if not exist 0003-qwt-release.patch "%CURL%" -L -o 0003-qwt-release.patch https://gist.githubusercontent.com/mugiseyebrows/885a600fd06902254e224ba757446e25/raw/81ea4ae58764a511c60cdaeb81dbc9e9524220d4/0003-qwt-release.patch
pushd qwt
    "%PATCH%" -N -i ..\0001-qwt-mingw1120_64.patch
    "%PATCH%" -N -i ..\0002-qwt-no-examples.patch
    "%PATCH%" -N -i ..\0003-qwt-release.patch
    qmake
    mingw32-make -j4
    mingw32-make install
popd
:qwt630_end