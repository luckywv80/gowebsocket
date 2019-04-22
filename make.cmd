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
 


echo step 1/5: create build output directory.
IF NOT EXIST bin mkdir bin
 

set GOPROXY=https://goproxy.io 

echo step 2/5: install libs...
go get -u -v github.com/golang/net/websocket

echo %GOPATH%

echo step 3/5: build server.exe   client.exe...
go build -i -o bin/server.exe src/server.go
go build -i -o bin/client.exe src/client.go
go build -i -o bin/server2.exe src/server2.go

echo step 4/5: build server , client ...
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build -i -o bin/server src/server.go  
go build -i -o bin/client src/client.go  
go build -i -o bin/server2 src/server2.go  

echo step 5/5: copy websocket.html
call copy %pwd%\src\websocket.html %pwd%\bin
echo build success!
echo 按任意键结束
pause>nul