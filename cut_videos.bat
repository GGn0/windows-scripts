@REM Cuts video files
@REM Prequisites: You need ffmpeg
@REM Settings: Edit the path of 'ffmpegdir'
@REM           Edit the start time 'start' (hh:mm:ss:ms)
@REM           Edit the output length 'duration' (hh:mm:ss:ms) 00:00:00.0 means 'until the end of the video'
@REM Usage: Drag and drop one or more video files on the batch file

@echo off
@Setlocal EnableDelayedExpansion

@if [%1]==[] goto :eof

@REM SETTINGS
@set ffmpegdir=C:\LiberKey\MyApps\ffmpeg\ffmpeg-20200720-43a08d9-win64-static\bin
@set start=00:00:10.0
@set duration=00:00:00.0

@REM replace all zeros : and . with an empty string to test duration
@set testduration=!duration:0=!
@set testduration=!testduration::=!
@set testduration=!testduration:.=!
@if "!testduration!" == "" ( @set dur=) else ( @set dur=-t !duration! )

:loop

@set drive=%~d1%
@set path=%~p1%
@set name=%~n1%
@set ext=%~x1%
@set file=%~1%

@REM Cut videos
@REM "%ffmpegdir%\ffmpeg" -ss %start% -i "%file%" -c:v libx265 -c:a aac -y -crf 20 -pix_fmt yuv420p!dur! "%drive%%path%%name%_cut%ext%"
"%ffmpegdir%\ffmpeg" -ss %start% -i "%file%" -c:v libx264 -c:a aac -y -crf 20 -pix_fmt yuv420p!dur! "%drive%%path%%name%_cut%ext%"

@shift

@if not [%1]==[] goto loop

@pause

@REM EOF
