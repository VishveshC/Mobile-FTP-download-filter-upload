@echo off
echo [93mPDF files to ZIP to Google Drive and Share by - Vishvesh[0m
mkdir %TEMP%\buffer-zip
sleep 3
set /P "text=Enter the file name: " 
echo [92mSet file name is: [95m%text%.zip[0m[0m
sleep 3

echo/
"7Zip\7z.exe" a "%TEMP%\buffer-zip\%text%.zip" "C:\Users\Black Box\Desktop\MOM\papers" -bso0 -bsp0

echo [92mZip file made.[0m

sleep 3

"rclone\rclone.exe" move --progress-terminal-title --progress --stats-one-line "%TEMP%\buffer-zip\%text%.zip" GoogleD:"/test"
echo [92mFile UPLOAD successful, Please check G-Drive[0m
pause

sleep 3
rmdir /s /q "C:\Users\Black Box\Desktop\MOM\papers"
sleep 1
mkdir "C:\Users\Black Box\Desktop\MOM\papers"
sleep 1
rmdir /s /q %TEMP%\buffer-zip
echo [91mLocal papers and buffer deleted, ZIP FILES SHOULD BE IN Google Drive[0m
pause