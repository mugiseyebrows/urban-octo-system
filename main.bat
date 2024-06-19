@echo off
rem This file is generated from main.pbat, all edits will be lost
set PATH=C:\Miniconda3;C:\Miniconda3\Scripts;%USERPROFILE%\Miniconda3;%USERPROFILE%\Miniconda3\Scripts;%PATH%
echo 1 %GITHUB_PATH%
echo 2 ${{ github.path }}
python -c "import os; print(os.path.realpath('.'))"
echo 3
if exist C:\Temp goto b_end
echo 4
:b_end
echo 5