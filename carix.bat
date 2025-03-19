@echo off
rem nyobain lebih elegan, tapi banyak dependencies nix nya. make label function di bawah
if [%1]==[] goto :gakada
set sumber_param=%*
if [%1]==[local]  (for /f "delims=" %%a in ('echo %sumber_param% ^| tr " " \n ^| sed 1d ^| paste -sd " "') do (set sumber_param=%%a))
if [%1]==[nas]    (for /f "delims=" %%a in ('echo %sumber_param% ^| tr " " \n ^| sed 1d ^| paste -sd " "') do (set sumber_param=%%a))
if [%1]==[omega]  (for /f "delims=" %%a in ('echo %sumber_param% ^| tr " " \n ^| sed 1d ^| paste -sd " "') do (set sumber_param=%%a))
if [%1]==[jargon] (for /f "delims=" %%a in ('echo %sumber_param% ^| tr " " \n ^| sed 1d ^| paste -sd " "') do (set sumber_param=%%a))
if [%1]==[all]    (for /f "delims=" %%a in ('echo %sumber_param% ^| tr " " \n ^| sed 1d ^| paste -sd " "') do (set sumber_param=%%a))

for /f "delims=" %%a in ('echo %sumber_param% ^| tr " " \n ^| grep -i [a-z0-9] ^| sed "s/^/(?=.*/;s/$/)/"^|paste -sd "!" ^| tr -d "!"') do (set param1=%%a)

call :create_database_file %1 temp_database
:loncatsetelah

if exist %2 (
    for /f "delims=" %%a in (%2) do (
        echo batch list from %2, search %1, %%a
        call carix %1 %%a
     )
    goto :eof
)

set inputdatabase=temp_database
set outputtext=___hasilcari.txt
set param1_file=%*
set param2_file=%param1_file:\=%
set param3_file=%param2_file:.=%
set param4_file=%param3_file:$=%
for /f "tokens=1,2 delims=," %%a in ('type %inputdatabase%^|grep -v "#"') do (
    echo ^> ^(locate -lfd -r -w -d "%%a" "%param1%"^)^>^>%outputtext%
    (locate -lfd -r -w -d "%%a" "%param1%")>>%outputtext%
    )
call timed start > NUL

if exist __01__*.txt (
    for /f "delims=" %%a in ('dir /b /on __*.txt^|grep "^__[0-9][0-9]__"^|tail -n 1^|tr "_" " "^|gawk "{printf(\"%%02g\", $1+1)}"') do (
        set nomer=%%a
    )
) else (
    set nomer=01
)

ren %outputtext% "__%nomer%__%wmic_start%_hasil_%param4_file%.txt"
type "__%nomer%__%wmic_start%_hasil_%param4_file%.txt"
echo file: "__%nomer%__%wmic_start%_hasil_%param4_file%.txt"
del %inputdatabase%
goto :eof

:gakada
echo Gak ada parameter, usage:
echo    %0 [string1] [string2] ...
echo    %0 [local,nas,omega,jargon,all] [string1] [string2] ...
echo    %0 [local,nas,omega,jargon,all] [fileinput]
goto :eof

Ini adalah Kumpulan fungsi nya, cuma bikin database yang dijadiin function label
================================================================================

:create_database_file
setlocal
set _var1=%1
> %2 (
    echo D:\IngsApplicationPortable\PortableApps\PortableApps\Locate32Portable\App\Locate32\database\files.dbs,2024-12-05 19:37
    echo D:\IngsApplicationPortable\PortableApps\PortableApps\Locate32Portable\App\Locate32\database\extJARGON.dbs,2024-08-27 18:50
    echo D:\IngsApplicationPortable\PortableApps\PortableApps\Locate32Portable\App\Locate32\database\extOMEGA.dbs,2024-12-11 13:15
    echo D:\stagnatz.dbs,2024-12-05 21:57
    echo D:\Xagant.dbs,2024-12-05 21:29
        @REM  D:\IngsApplicationPortable\PortableApps\PortableApps\Locate32Portable\App\Locate32\database\extGargantua.dbs
        @REM  D:\IngsApplicationPortable\PortableApps\PortableApps\Locate32Portable\App\Locate32\database\extMACRW.dbs
        @REM  D:\IngsApplicationPortable\PortableApps\PortableApps\Locate32Portable\App\Locate32\database\extScience.dbs
        @REM  D:\IngsApplicationPortable\PortableApps\PortableApps\Locate32Portable\App\Locate32\database\extTerra.dbs
        @REM  D:\IngsApplicationPortable\PortableApps\PortableApps\Locate32Portable\App\Locate32\database\extWORK.dbs

)
(set _var2=2 3)
(set _var3=localnNAS)
if [%_var1%]==[local]  (set _var3=local&   set _var2=2 3 4 5)
if [%_var1%]==[nas]    (set _var3=nas&     set _var2=1 2 3)
if [%_var1%]==[omega]  (set _var3=omega&   set _var2=1 2 4 5)
if [%_var1%]==[jargon] (set _var3=jargon&  set _var2=1 3 4 5)
if [%_var1%]==[all]    (set _var3=all&     goto :eof)

echo %_var1%, database: %_var3%, exclude: %_var2%, find: %param1%
for /f "delims=" %%a in ('echo %_var2% ^| tr " " \n') do (
    sed -i "%%as/^/#/" %2
)
endlocal
goto :eof