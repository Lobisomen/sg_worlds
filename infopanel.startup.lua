print("Waiting 10 seconds so we don't try and wrap peripherals before they're ready")
sleep(10)
print()
local rnd = math.random(20)
print("Also waiting a random amount of time ("..rnd.."sec.) so we don't slam the server with tons of HTTP requests")
print()
sleep(rnd)

-- install any updates to this startup script
print("Updating startup script")
local start_src = http.get("https://raw.github.com/Lobisomen/sg_worlds/master/infopanel_startup.lua")
if start_src ~= nil then
	local file = fs.open("/startup","w")
	file.write(start_src.readAll())
	file.close()
	start_src.close()
	print("Startup script updated successfully")
else
	print("Failed to update startup script")
end

-- Download all planet information
print("Updating SGInfo's Planet and Dimension data")
if not getAndSave("https://raw.github.com/Lobisomen/sg_worlds/master/worlds/earth.nfp","/worlds/earth.nfp") then
	print("Failed to update SGInfos' data")
else
	print("SGInfo's Planet and Dimension data updated successfully")
end

print()

-- install any updates to SGInfo
print("Updating SGInfo")
local sgc_src = http.get("https://raw.github.com/Lobisomen/sg_worlds/master/SGInfo.lua")
if sgc_src ~= nil then
	local file = fs.open("/SGInfo","w")
	file.write(sgc_src.readAll())
	file.close()
	sgc_src.close()
	print("SGInfo updated successfully")
else
	print("Failed to update SGInfo")
end
print()
print("Starting up SGInfo")
shell.run("SGInfo")
