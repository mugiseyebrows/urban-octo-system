@echo off
rem This file is generated from main.pbat, all edits will be lost
set PATH=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build;%PATH%
where cmake
call vcvars64.bat
where cmake
pyfind C:\Miniconda > conda.txt