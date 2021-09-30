:: Epic script by Read

::Stream #0:0: Video: hevc
::Stream #0:2(jpn): Audio: aac (LC)
::Stream #0:4(eng): Subtitle: ass -> English Sub [UTW]

@echo off

set /p V_ID="Video track: "
set /p A_ID="Audio track: "
set /p S_ID="Subtitle track: "

echo %V_ID%
echo %A_ID%
echo %S_ID%

FOR /F "delims=*" %%A IN ('dir /b *.MKV') DO "ffmpeg.exe" -i "%%A" -map 0:%V_ID% -map 0:%A_ID% -map 0:%S_ID%? -acodec copy -vcodec copy "fixed_%%A"

PAUSE