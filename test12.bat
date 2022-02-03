@echo off
echo [93mMobile file transfer via FTP to local buffer by - Vishvesh[0m
sleep 3
mkdir %TEMP%\buffer-pdf
echo [92mBuffer Created[0m
sleep 3
start cmd.exe /c "lftp -f "config/testfiled.lftp""
echo [92mFile transfer successful.[0m
sleep 3

set source="%TEMP%\buffer-pdf\"
set destination="C:\Users\Black Box\Desktop\MOM\papers"
for %%F in (%destination%) do set destination="%%~fF"
for /r %source% %%F in (.) do if "%%~fF" neq %destination% ROBOCOPY "%%F" %destination% *.pdf /COPYALL /R:0 /MT[:4] /NFL /NDL /NJH /NJS /MAXAGE:2
sleep 1
rmdir /s /q %TEMP%\buffer-pdf
echo [91mBuffer deleted, PDF FILES SHOULD BE IN Mom/papers[0m
pause