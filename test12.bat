@echo off
echo [93mMobile file transfer via FTP to local buffer by - Vishvesh[0m
cd "%USERPROFILE%\Desktop\Dependencies"

timeout 3

mkdir %TEMP%\buffer-pdf
echo [92mBuffer Created[0m

timeout 3
start cmd.exe /c "winscp\winscp.com /ini=nul /script="%USERPROFILE%\Desktop\Dependencies\winscptest.txt""
echo [92mFile transfer successful.[0m

timeout 3

set DESKFOLDERNAME=MOM
set source="%TEMP%\buffer-pdf\"
set destination="%USERPROFILE%\Desktop\%DESKFOLDERNAME%\papers"
for %%F in (%destination%) do set destination="%%~fF"
for /r %source% %%F in (.) do if "%%~fF" neq %destination% ROBOCOPY "%%F" %destination% *.pdf /COPYALL /R:0 /MT[:4] /NFL /NDL /NJH /NJS

timeout 1

rmdir /s /q %TEMP%\buffer-pdf
echo [91mBuffer deleted, PDF FILES SHOULD BE IN MOM/papers[0m

pause