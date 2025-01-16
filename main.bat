@echo off
rem This file is generated from main.pbat, all edits will be lost
set PATH=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build;%PATH%
where cmake || echo no cmake
where ninja || echo no ninja
where gcc || echo no gcc
where python || echo no python
where 7z || echo no 7z
call vcvars64.bat
where cmake || echo no cmake
where ninja || echo no ninja
where gcc || echo no gcc
where python || echo no python
where 7z || echo no 7z
pip install pyfindlib
echo C:\hostedtoolcache\windows
pyfind C:\hostedtoolcache\windows > hostedtoolcache.txt
echo C:\ProgramData\Chocolatey
pyfind C:\ProgramData\Chocolatey > chocolatey.txt
echo C:\Program Files\Microsoft Visual Studio
pyfind "C:\Program Files\Microsoft Visual Studio" > visual_studio.txt
echo C:\Program Files
pyfind "C:\Program Files" > program_files.txt