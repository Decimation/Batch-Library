:: Input: Audio devices to cycle through, delimited by a comma
:: Uses AudioDevices PowerShell script
:: Example (Batch): "Cycle Audio Devices.bat" "@('FiiO DAC','Speakers')"
:: Example (PS): & '.\Cycle Audio Devices.bat' "@('FiiO DAC','Speakers')"

@echo off
setlocal EnableDelayedExpansion

:: "C:\Users\Deci\Documents\PowerShell\Scripts\AudioDevices.ps1" "-Names @('FiiO DAC','Speakers','Headset') -MultimediaDefault"

set script=%userprofile%\Documents\PowerShell\Scripts\AudioDevices.ps1

if not exist %script% (
    rem echo "%script%"
    echo Missing script
	exit /b -1

)

rem echo %1
rem echo %2

set "option="

for %%a in (%*) do (
   if not defined option (
      set arg=%%a
      rem if "!arg:~0,1!" equ "-" set "option=!arg!"
      set "option=!arg!"

   ) else (
      set "option!option!=%%a"
      set "option="
   )
)

if not defined option (
	rem set option="@('FiiO DAC','Speakers','Headset')"
	rem set option="@(%DefaultAudioDevices%)"
	echo Missing arguments
    exit /b -1
)

SET option

echo "Input: %option%"
if exist %DefaultAudioDevices% (
    echo "Default input: %DefaultAudioDevices%"
)

pwsh.exe -c " . %script% -Names %option% -MultimediaDefault"