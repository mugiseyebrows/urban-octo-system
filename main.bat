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
pyfind C:\hostedtoolcache\windows > hostedtoolcache.txt
pyfind C:\ProgramData\Chocolatey > chocolatey.txt
pyfind C:\Program Files\Microsoft Visual Studio > visual_studio.txt