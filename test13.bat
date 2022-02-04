@echo off
echo [93mPDF files to ZIP to Google Drive and Share by - Vishvesh[0m
cd "C:\Users\%USERPROFILE%\Desktop\Dependencies"

mkdir %TEMP%\buffer-zip

sleep 3
set DESKFOLDERNAME=MOM
set /P "text=Enter the file name: " 
echo [92mSet file name is: [95m%text%.zip[0m[0m

sleep 3

echo/
"7zip\7z.exe" a "%TEMP%\buffer-zip\%text%.zip" "%USERPROFILE%\Desktop\%DESKFOLDERNAME%\papers" -bso0 -bsp0
ROBOCOPY "%TEMP%\buffer-zip" "%USERPROFILE%\Desktop\%DESKFOLDERNAME%\papers-archive" *.zip /COPYALL /R:0 /MT[:4] /NFL /NDL /NJH /NJS
echo [92mZip file made. And backup made to MOM\paper-archive[0m

sleep 3

"rclone\rclone.exe" move --progress --stats-one-line "%TEMP%\buffer-zip\%text%.zip" GoogleD:"/test"
echo [92mFile UPLOAD successful, Please check G-Drive[0m

pause

sleep 3
del /s /q "%USERPROFILE%\Desktop\%DESKFOLDERNAME%\papers\" *.pdf

sleep 1

rmdir /s /q %TEMP%\buffer-zip
echo [91mLocal papers and buffer deleted, ZIP FILES SHOULD BE IN Google Drive[0m

pause