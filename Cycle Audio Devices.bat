:: Input: Audio devices to cycle through, delimited by a comma
:: The environment variable DefaultAudioDevices is the fallback default

@echo off
setlocal EnableDelayedExpansion


:: "C:\Users\Deci\Documents\PowerShell\Scripts\AudioDevices.ps1" "-Names @('FiiO DAC','Speakers','Headset') -MultimediaDefault"

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
	set option="@(%DefaultAudioDevices%)"

)

SET option

echo "Input: %option%"
echo "Default input: %DefaultAudioDevices%"

pwsh -c " . %userprofile%\Documents\PowerShell\Scripts\AudioDevices.ps1 -Names %option% -MultimediaDefault"