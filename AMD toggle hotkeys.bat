

@echo OFF

setlocal ENABLEEXTENSIONS
set KEY_NAME="HKEY_CURRENT_USER\SOFTWARE\AMD\DVR"
set VALUE_NAME="HotkeysDisabled"

FOR /F "usebackq skip=2 tokens=1-3" %%A IN (`REG QUERY %KEY_NAME% /v %VALUE_NAME% 2^>nul`) DO (
	set ValueName=%%A
	set ValueType=%%B
	set ValueValue=%%C

	if defined ValueName (
    rem @echo Value Name = %ValueName%
    rem @echo Value Type = %ValueType%
	 rem @echo Value Value = %ValueValue%

    if %%C EQU 1 (
       @echo "on"
		 (reg.exe add HKCU\SOFTWARE\AMD\DVR\ /v HotkeysDisabled /t REG_DWORD /d 0 /f)>nul
    ) else (
		 @echo "off"
		 (reg.exe add HKCU\SOFTWARE\AMD\DVR\ /v HotkeysDisabled /t REG_DWORD /d 1 /f)>nul
       
    )
    ) else (
        rem @echo %KEY_NAME%\%VALUE_NAME% not found.
    )
	 rem echo %ERRORLEVEL%
)

