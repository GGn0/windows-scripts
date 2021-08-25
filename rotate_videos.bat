@REM Rotates video files
@REM Prequisites: You need ffmpeg
@REM Settings: Edit the path of 'ffmpegdir'
@REM           Edit the rotation setting 'rotate':
@REM                cclock_flip = Rotate by 90 degrees counterclockwise and vertically flip
@REM                clock = Rotate by 90 degrees clockwise
@REM                cclock = Rotate by 90 degrees counterclockwise
@REM                clock_flip = Rotate by 90 degrees counterclockwise and vertically flip
@REM Usage: Drag and drop one or more video files on the batch file
@echo off
@Setlocal EnableDelayedExpansion

@if [%1]==[] goto :eof

@REM SETTINGS
@set ffmpegdir=C:\LiberKey\MyApps\ffmpeg\ffmpeg-20200720-43a08d9-win64-static\bin
@set rotate=clock

:loop

@set drive=%~d1%
@set path=%~p1%
@set name=%~n1%
@set ext=%~x1%
@set file=%~1%

@REM Cut and rotate videos
"%ffmpegdir%\ffmpeg" -i "%file%" -vf "transpose=%rotate%" "%drive%%path%%name%_rotated%ext%"

@shift

@if not [%1]==[] goto loop

@pause

@REM EOF
