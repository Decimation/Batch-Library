@echo off
setlocal EnableDelayedExpansion

REM "C:\Users\Deci\Documents\PowerShell\Scripts\AudioDevices.ps1" "-Names @('FiiO DAC','Speakers','Headset') -MultimediaDefault"

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
)

SET option

echo %option%

pwsh -c " . %userprofile%\Documents\PowerShell\Scripts\AudioDevices.ps1 -Names %option% -MultimediaDefault"