-- Checks if config folder exists, if not it makes one.
os.execute("if not exist config mkdir config")
-- Write config help file to configInfo.txt
cfgInfo = io.open("config/configInfo.txt", 'w')
cfgInfo:write("line 1: Maximum password length\nline 2: Minimum password length\nline 3/4: The characters to use")
cfgInfo:close()
-- Checks if config exists, if not it makes it.
cfgCheck = io.open("config/config.cfg", r)
if cfgCheck == nil then
  cfgCheck = nil
  cfg = io.open("config/config.cfg", 'w')
  cfg:write("64\n8\n33\n126")
  cfg:close()
else
  cfgCheck:close()
end
-- Sets defaults
cfg = nil
minLen = "NaN"
maxLen = "NaN"
-- Loads config
cfg = io.open("config/config.cfg")
maxLen = cfg:read("*line")
minLen = cfg:read("*line")
charRange1 = cfg:read("*line")
charRange2 = cfg:read("*line")
cfg:close()
minLen = tonumber(minLen)
maxLen = tonumber(maxLen)
-- Tells you that you can change some stuff in config
io.write("change options is config.cfg")
-- Tells you what the minimum and maximum password lenght is.
io.write("\nMaximum password length: ",maxLen,"\nMinimum password length: ",minLen,"\n\n")
-- Starts the loop.
while true do
  -- Randomizes.
  math.randomseed(math.floor(os.clock()*10000))
  -- Asks for input
	io.write("Password length: "); length = io.read()
  -- Adds a break condition
	if length == "exit" then break end
  -- Makes sure length is a number
	length = tonumber(length)
  -- Checks if length is a valid input
	if length ~= nil and length <= maxLen and length >= minLen then
    -- Checks what time the password started to generate is
	  startTime = os.clock()
    -- Opens the password file.
		passFile = io.open("passwords.txt", 'a')
    -- Generates the password
		for i = 1, length do passFile:write(string.char(math.random(charRange1, charRange2))) end
    -- Sets a double line break in password file so you know which password is which
    passFile:write("\n\n")
    -- Closes the password file
		passFile:close()
    -- Tells you how long it took
		io.write("done, took ",os.clock()-startTime," seconds\n")
    -- The fail condition
	else io.write("Invalid input\n") end
end
-- Clears the RAM
collectgarbage("collect")
