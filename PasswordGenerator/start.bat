@echo off
if exist bin\bin.lua start "Password Generator" bin\lua\lua.exe bin\bin.lua && exit
if exist bin\bin.luac start "Password Generator" bin\lua\lua.exe bin\bin.luac && exit
echo Password generator file not found, exiting.
timeout 5 > nul
