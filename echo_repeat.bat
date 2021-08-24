@REM Inefinitelly repeat a series of characters
@REM Settings: You can edit the repeater characters (add/remove etc..) at line 10+
@REM           You can adjust the time delay in milliseconds with the ping command

@setlocal EnableDelayedExpansion

@set c=0

@REM Edit character list here
@set list[0]=_
@set list[1]=.
@set list[2]=~
@set list[3]="
@set list[4]=(
@set list[5]=_

@set len=0
@cls

:GETSIZE
@IF defined list[%len%] (
  @<nul set /p =!list[%len%]!
  @set /A len=!len!+1
  @GOTO GETSIZE
)

@ECHO  %len%-characters repeating string

:LOOP

@set /A c=c%%len
@<nul set /p =!list[%c%]!
@REM Wait in milliseconds
@ping 192.0.0.0 -n 1 -w 200 >nul
@set /A c=c+1

@GOTO LOOP

@REM EOF
