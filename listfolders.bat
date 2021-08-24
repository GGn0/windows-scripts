@REM Lists all subfolders of curent directory

@echo off
@setlocal enabledelayedexpansion
for /f "tokens=*" %%G in ('dir /b /a:d "."') do (
  @set folder=%%G
  @echo Found !folder!
)
@pause

@REM EOF
