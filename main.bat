@echo off
rem This file is generated from main.pbat, all edits will be lost
set PATH=C:\Program Files\CMake\bin;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build;%PATH%
if exist C:/myapp goto foo_end
echo myapp not found
call vcvars64.bat
if not exist "build" mkdir "build"
pushd build
    cmake -G Ninja -DCMAKE_INSTALL_PREFIX=C:/myapp ..
    cmake --build .
    cmake --install .
popd
:foo_end