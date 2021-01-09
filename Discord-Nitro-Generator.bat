::[Bat To Exe Converter]
::
@echo off
title Discord Nitro Generator

echo Hello and Welcome to the Discord Nitro Generator made by cookiez#2154. If you want to continue, press any key now..
pause
cls
:gui_dialog_1
set first_choices=Generate Nitro Code,Exit&set title=Discord Nitro Generator
call :choice "Discord Nitro Generator" "%first_choices%" CHOICE
if not defined CHOICE color 0c &echo  ERROR! No choice selected.. &timeout /t 20 &color 07 &exit/b
goto gui_dialog_2

:gui_dialog_2
:: Process results from dialog_1
if "%CHOICE%"=="Generate Nitro Code" goto :GENERATE
if "%CHOICE%"=="Exit" goto :EXIT
:: Quit if no choice selected
if not defined CHOICE color 0c &echo  ERROR! No choice selected.. &timeout /t 20 >nul &color 07 &exit/b

:GENERATE
cls
Setlocal EnableDelayedExpansion
Set _RNDLength=19
Set _Alphanumeric=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
Set _Str=%_Alphanumeric%987654321
:_LenLoop
IF NOT "%_Str:~18%"=="" SET _Str=%_Str:~9%& SET /A _Len+=9& GOTO :_LenLoop
SET _tmp=%_Str:~9,1%
SET /A _Len=_Len+_tmp
Set _count=0
SET _RndAlphaNum=
:_loop
Set /a _count+=1
SET _RND=%Random%
Set /A _RND=_RND%%%_Len%
SET _RndAlphaNum=!_RndAlphaNum!!_Alphanumeric:~%_RND%,1!
If !_count! lss %_RNDLength% goto _loop
echo https://discord.gift/!_RndAlphaNum! >> gift.txt
echo The Discord Nitro Gift Code has been created in a file called "gift.txt", thank you for using the Discord Nitro Generator! 
pause
exit

::---------------------------------------------------------------------------------------------------------------------------------
:choice
rem 1=title 2=options 3=output_variable                                          example: call :choice Choose "op1,op2,op3" result
setlocal & set "c=about:<title>%~1</title><head><script language='javascript'>window.moveTo(-200,-200);window.resizeTo(100,100);"
set "c=%c% </script><hta:application innerborder='no' sysmenu='yes' scroll='no'><style>body{background-color:#17141F;}"
set "c=%c% br{font-size:14px;vertical-align:-4px;} .button{background-color:#7D5BBE;border:2px solid #392E5C; color:white;"
set "c=%c% padding:4px 4px;text-align:center;text-decoration:none;display:inline-block;font-size:16px;cursor:pointer;"
set "c=%c% width:100%%;display:block;}</style></head><script language='javascript'>function choice(){"
set "c=%c% var opt=document.getElementById('options').value.split(','); var btn=document.getElementById('buttons');"
set "c=%c% for (o in opt){var b=document.createElement('button');b.className='button';b.onclick=function(){
set "c=%c% close(new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(this.value));};"
set "c=%c% b.appendChild(document.createTextNode(opt[o]));btn.appendChild(b);btn.appendChild(document.createElement('br'));};"
set "c=%c% btn.appendChild(document.createElement('br'));var r=window.parent.screen;"
set "c=%c% window.moveTo(r.availWidth/3,r.availHeight/6);window.resizeTo(r.availWidth/3,document.body.scrollHeight);}</script>"
set "c=%c% <body onload='choice()'><div id='buttons'/><input type='hidden' name='options' value='%~2'></body>"
for /f "usebackq tokens=* delims=" %%# in (`mshta "%c%"`) do set "choice_var=%%#"
endlocal & set "%~3=%choice_var%" & exit/b &rem By cookiez#2154
::-------------------------------------------------------------------------------------------------------------------------------- 