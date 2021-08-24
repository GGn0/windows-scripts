@REM Re-encodes video files to reduce their size
@REM Prequisites: You need ffmpeg
@REM Settings: Edit the path of 'ffmpegdir' 
@REM Usage: Drag and drop one or more video files on the batch file
@REM        Optionally you can adjust the command at line 24

@echo off
@Setlocal EnableDelayedExpansion

@if [%1]==[] goto :eof

@set ffmpegdir=C:\LiberKey\MyApps\ffmpeg\ffmpeg-20200720-43a08d9-win64-static\bin

:loop

@set drive=%~d1%
@set path=%~p1%
@set name=%~n1%
@set ext=%~x1%
@set file=%~1%

@REM shrink dropped video
@REM "%ffmpegdir%\ffmpeg" -i "%file%"  -c:v libx265 -c:a aac -y -x265-params crf=20 -pix_fmt yuv420p "%drive%%path%%name%_small.mp4
"%ffmpegdir%\ffmpeg" -i "%file%"  -c:v libx264 -c:a aac -y -crf 20 -pix_fmt yuv420p "%drive%%path%%name%_small.mp4

@shift

@if not [%1]==[] goto loop

@echo DONE!

@pause

@REM EOF
