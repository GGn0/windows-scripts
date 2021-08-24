@REM Applies a gaussian blur to image files to reduce their size
@REM Prequisites: You need imgmagick
@REM Settings: Edit the path of 'imgmagickdir' 
@REM Usage: Drag and drop one or more image files on the batch file
@REM        Optionally you can adjust the command at line 23

@echo off
@Setlocal EnableDelayedExpansion

@if [%1]==[] goto :eof

@set imgmagickdir=C:\LiberKey\MyApps\ImageMagick-7.0.9-22-portable-Q16-x64

:loop

@set drive=%~d1%
@set path=%~p1%
@set name=%~n1%
@set ext=%~x1%
@set file=%~1%

@REM shrink dropped video
"%imgmagickdir%\convert" -strip -interlace Plane -gaussian-blur 0.05 -quality 80%% "%file%" "%drive%%path%%name%_small%ext%"

@shift

@if not [%1]==[] goto loop

@echo DONE!

@pause

@REM EOF
