@echo off

title = Sistema de monitoreo - INFOTEL
mode con:cols=70 lines=14

REM CAMBIAR SOLO USANDO "w10" o "w7"
REM w10	equivale a Windows 10
REM w7	equivale a Windows 7
set windows=w10

REM CONFIGURACION, ESTOS SON LOS SERVIDORES PARA HACER PING
REM SIEMPRE USAR TRES OPCIONES
REM EL ULTIMO ES EL IP DEL ROUTER, SE USA PARA SABER SI
REM ES PROBLEMA DE LA CONEXION DEL EQUIPO CON LA RED O
REM EL EQUIPO CON INTERNET

set servidor1=google.com
set servidor2=1.1.1.1
set gatewayLocal=192.168.1.1

REM MANTENER LOS ESPACIO QUE TIENEN / PARA QUE EN EL
REM ARCHIVO SE VEA ORDENADO
set nombreServidor1=Google        /
set nombreServidor2=DNS CloudFlare /
set nombreServidor3=Router        /


REM USAR ESTAS TRES VARIABLES BORRANDO EL "REM" SI ES WINDOWS 7
REM set fecha=%Date:~-4%-%Date:~3,2%-%Date:~0,2%
REM set Separador=__
REM set hora=%Time:~0,2%-%Time:~3,2%-%Time:~6,2%

REM USAR ESTAS TRES VARIABLES BORRANDO EL "REM" SI ES WINDOWS 10
REM set fecha=%DATE:~5,2%-%DATE:~8,2%-%DATE:~11,4%
REM set Separador=__
REM set hora=%Time:~0,2%-%Time:~3,2%-%Time:~6,2%



set Separador=__
set hora=%time:~0,2%
if "%hora:~0,1%" == " " set hora=0%hora:~1,1%
set tiempo=%hora%-%Time:~3,2%-%Time:~6,2%

if %windows% == w7 (
	set fecha=%Date:~-4%-%Date:~3,2%-%Date:~0,2%
) else if %windows% == w10 (
	set fecha=%DATE:~5,2%-%DATE:~8,2%-%DATE:~11,4%
) else (
echo ##
echo ERROR. VER CONFIGURACION.
echo ##
break)


echo.       																													 
echo              _____ _   _ ______ ____ _______ ______ _
echo             !_   _! \ ! !  ____/ __ \__   __!  ____! !
echo               ! ! !  \! ! !__ ! !  ! ! ! !  ! !__  ! !
echo               ! ! ! . ` !  __!! !  ! ! ! !  !  __! ! !
echo              _! !_! !\  ! !   ! !__! ! ! !  ! !____! !____
echo             !_____!_! \_!_!    \____/  !_!  !______!______!
echo.
echo.
echo.
echo Sistema para el control y monitoreo de la conexion a internet.


REM ############################################################
REM #######################   SOFTWARE   #######################
REM ############################################################

set nombre=%fecha%%Separador%%tiempo%
echo %nombre% > %nombre%.txt

REM Hacemos ping y lo anadimos poniendo la fecha delante linea a linea
:LOOPSTART 

set primeraLinea="%nombreServidor1% %time:~,-3% "
set primeraLinea2="%nombreServidor2% %time:~,-3% "
set primeraLinea3="%nombreServidor3% %time:~,-3% "



    (
      FOR /L %%i in (1,1,1) do (
        <nul (set /p tm=%primeraLinea% )
        PING -n 1 %servidor1% | FIND "TTL"
        IF ERRORLEVEL 1 (
        	ECHO Error, Tiempo de espera agotado.
    		<nul (set /p tm=%primeraLinea2% )
        	PING -n 1 %servidor2% | FIND "TTL"
        	IF ERRORLEVEL 1 (
        		ECHO Error, Tiempo de espera agotado.
    			<nul (set /p tm=%primeraLinea3% )
        		PING -n 1 %gatewayLocal% | FIND "TTL"
        		IF ERRORLEVEL 1 (
        			ECHO Error, Tiempo de espera agotado.
        		)
    		)
    	)	
    )
    ) >> %nombre%.txt
 
REM tiempo que queremos que pase entre ping y ping en segundos
timeout 10 > NUL
 
GOTO LOOPSTART

pause