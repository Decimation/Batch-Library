:: Input: Audio devices to cycle through, delimited by a comma
:: Uses AudioDevices PowerShell script

@echo off
setlocal EnableDelayedExpansion

:: "C:\Users\Deci\Documents\PowerShell\Scripts\AudioDevices.ps1" "-Names @('FiiO DAC','Speakers','Headset') -MultimediaDefault"

set script=%userprofile%\Documents\PowerShell\Scripts\AudioDevices.ps1

if exist %script% (
    echo "%script%"
)

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
	set option="@('FiiO DAC','Speakers','Headset')"
	rem set option="@(%DefaultAudioDevices%)"

)

SET option

echo "Input: %option%"
echo "Default input: %DefaultAudioDevices%"

pwsh.exe -c " . %script% -Names %option% -MultimediaDefault"