@echo off
chcp 65001
echo +-------------------------------------------------------+
echo ^|      北京智慧山信息技术有限公司   15652963646     ^|
echo +-------------------------------------------------------+

echo %GOPATH%
 
rmdir /Q /S bin>nul 2>nul

for /f %%i in ('chdir') do set pwd=%%i

echo %pwd%

for /f %%k in ('go env GOPATH') do set gp=%%k

for /f %%k in ('go env GOROOT') do set gr=%%k
 


echo step 1/3: create build output directory.
IF NOT EXIST bin mkdir bin
 

set GOPROXY=https://goproxy.io 

echo step 2/3: install libs...


echo %GOPATH%

echo step 3/3: build gows.exe...
go build -i -o bin/gows.exe src/main.go

echo build success!
echo 按任意键结束
pause>nul