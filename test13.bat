@echo off
echo [93mPDF files to ZIP to Google Drive and Share by - Vishvesh[0m
sleep 3
set /p filename="File-name: "
echo [92mSet file name is: %filename%.zip[0m
sleep 3
"C:\Program Files\7-Zip\7z.exe" a "C:\Users\Black Box\Desktop\MOM\Math-papers-checked.zip" "C:\Users\Black Box\Desktop\MOM\papers"
echo [92mZip file made.[0m
sleep 3
"C:\Program Files\rclone-v1.57.0-windows-amd64\rclone.exe" move --verbose --progress --stats-one-line-date "C:\Users\Black Box\Desktop\MOM\Math-papers-checked.zip" GoogleD:"/test"
echo [92mFile UPLOAD successful, Please check G-Drive[0m
pause
sleep 3
rmdir /s /q "C:\Users\Black Box\Desktop\MOM\papers"
sleep 1
mkdir "C:\Users\Black Box\Desktop\MOM\papers\"
echo [91mLocal papers deleted, ZIP FILES SHOULD BE IN Google Drive[0m