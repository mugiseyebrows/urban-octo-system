@echo off
rem This file is generated from main.pbat, all edits will be lost
echo 1 %GITHUB_ACTION_PATH%
echo 2 ${{ github.action_path }}
echo 3
if exist C:\Temp goto b_end
echo 4
:b_end
set
echo 5