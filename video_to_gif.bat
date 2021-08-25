@REM Converts video files to gifs
@REM Prequisites: You need ffmpeg
@REM Settings: Edit the path of 'ffmpegdir' 
@REM           Edit the output gif length 'duration' (hh:mm:ss.ms) 00:00:00.0 means until the end of the file
@REM           Edit the output speed multiplicator 'speed'
@REM           Edit the speex text overlay size 'labelsize' (0 means no label)
@REM Usage: Drag and drop one or more video files on the batch file
@REM        One of the two command lines (line 55) is for HQ output

@echo off
@Setlocal EnableDelayedExpansion

@if [%1]==[] goto :eof

@REM SETTINGS
@set ffmpegdir=C:\LiberKey\MyApps\ffmpeg\ffmpeg-20200720-43a08d9-win64-static\bin
@set duration=00:00:00.0
@set speed=20
@set labelsize=100

@REM replace all zeros : and . with an empty string to test duration
@set testduration=!duration:0=!
@set testduration=!testduration::=!
@set testduration=!testduration:.=!
@if "!testduration!" == "" ( @set dur=) else ( @set dur=-t !duration! )

@REM check label size
@if %labelsize% LEQ 0 ( @set label=) else ( 
    @set label=",drawtext=text='%speed%x':fontcolor=white:fontsize=%labelsize%:box=1:boxcolor=black@0.7:boxborderw=5:x=(w-text_w-h/100):y=(h-text_h-h/100)"
    @set label=!label:~1,-1!
)

@REM get timestamps location
@if %speed% LEQ 1 ( 
    @set pts=1 
) else (
    @if %speed% GEQ 1000 (
        @set pts=1 
    ) else (
        @set /A tmp= 1000/%speed%
        @REM pad the number
        @set pts=00!tmp!
        @set pts=0.!pts:~-3,-1!
    )
)

:loop

@set drive=%~d1%
@set path=%~p1%
@set name=%~n1%
@set file=%~1%

@REM convert dropped video to gif
@REM "%ffmpegdir%\ffmpeg" -i "%file%" -vf "setpts=!pts!*PTS,drawtext=text='%speed%x':fontcolor=white:fontsize=%labelsize%:box=1:boxcolor=black@0.7:boxborderw=5:x=(w-text_w-5):y=(h-text_h-5),split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse"!dur! "%drive%%path%%name%.gif
"%ffmpegdir%\ffmpeg" -i "%file%" -y -vf "setpts=!pts!*PTS!label!"!dur! "%drive%%path%%name%.gif

shift

if not [%1]==[] goto loop

@pause

@REM EOF
