cfgInfo = io.open("config/configInfo.txt", 'w') 
cfgInfo:write("line 1: Maximum password length\nline 2: Minimum password length\nline 3/4: The characters to use") 
cfgInfo:close() 
cfgCheck = io.open("config/config.cfg", r) 
if cfgCheck == nil then 
  cfgCheck = nil 
  cfg = io.open("config/config.cfg", 'w') 
  cfg:write("64\n8\n33\n126") 
  cfg:close() 
else 
  cfgCheck:close() 
end 
cfg = nil 
minLen = "NaN" 
maxLen = "NaN" 
cfg = io.open("config/config.cfg") 
maxLen = cfg:read("*line") 
minLen = cfg:read("*line") 
charRange1 = cfg:read("*line") 
charRange2 = cfg:read("*line") 
cfg:close() 
minLen = tonumber(minLen) 
maxLen = tonumber(maxLen) 
io.write("change options is config.cfg") 
io.write("\nMaximum password length: ",maxLen,"\nMinimum password length: ",minLen,"\n\n") 
while true do 
  math.randomseed(math.floor(os.clock()*10000)) 
	io.write("Password length: "); length = io.read() 
	if length == "exit" then break end 
	length = tonumber(length) 
	if length ~= nil and length <= maxLen and length >= minLen then 
	  startTime = os.clock() 
		passFile = io.open("passwords.txt", 'a') 
		for i = 1, length do passFile:write(string.char(math.random(charRange1, charRange2))) end 
		passFile:write("\n\n") 
		passFile:close() 
		io.write("done, took ",os.clock()-startTime," seconds\n") 
	else io.write("Invalid input\n") end 
end 
collectgarbage("collect"); collectgarbage("collect") 
