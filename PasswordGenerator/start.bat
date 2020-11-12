@echo off
if exist bin\bin.lua start "Password Generator" bin\lua\lua.exe bin\bin.lua
if exist bin\bin.luac start "Password Generator" bin\lua\lua.exe bin\bin.luac
