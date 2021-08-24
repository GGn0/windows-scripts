@REM Lists all files in current folder

@echo off
@setlocal enabledelayedexpansion
@set file_n=0
for /f "tokens=*" %%G in ('dir /b /a:-d "."') do (
  @set file=%%G
  @set /A file_n=!file_n!+1
  @echo Found !file! (Nr !file_n!^)
)
@pause

@REM EOF
