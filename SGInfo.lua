monitor = peripheral.wrap("top")
monitor.setTextScale(0.5)


function Info_Earth()
term.redirect(monitor)
monitor.clear()
monitor.setCursorPos(10,20)
monitor.write("EARTH")
monitor.setCursorPos(4,21)
monitor.write("(Terrestrial Planet)")
monitor.setTextColor(colors.cyan)
monitor.setCursorPos(30,3)
monitor.write("CHARACTERISTICS")
monitor.setCursorPos(30,9)
monitor.write("PHYSICAL CHARACTERISTICS")
monitor.setCursorPos(30,15)
monitor.write("ATMOSPHERE")
monitor.setTextColor(colors.white)
monitor.setCursorPos(30,4)
monitor.write("Aphelion: 152.098.232 Km")
monitor.setCursorPos(30,5)
monitor.write("Perihelion: 147.098.290 Km")
monitor.setCursorPos(30,6)
monitor.write("Orbital Period: 365 days")
monitor.setCursorPos(30,7)
monitor.write("Satellite: YES (1)")
monitor.setCursorPos(30,10)
monitor.write("Mean Radius: 6.371 Km")
monitor.setCursorPos(30,11)
monitor.write("Surface Gravity: 1g (100%)")
monitor.setCursorPos(30,12)
monitor.write("Rotation Period: 24h")
monitor.setCursorPos(30,13)
monitor.write("Mean Temperature: 15 C")
monitor.setCursorPos(30,16)
monitor.write("Nitrogen 78%, Oxygen 21%")
monitor.setCursorPos(30,17)
monitor.write("Water Vapor 1%")
monitor.setCursorPos(30,18)
monitor.write("Traces of Argon and CO2")
image = paintutils.loadImage("earth.nfp")
paintutils.drawImage(image,2,5)
term.redirect(term.native())
end


function Info_Mars()
term.redirect(monitor)
monitor.clear()
monitor.setCursorPos(10,20)
monitor.write("MARS")
monitor.setCursorPos(4,21)
monitor.write("(Terrestrial Planet)")
monitor.setTextColor(colors.cyan)
monitor.setCursorPos(30,3)
monitor.write("ORBITAL CHARACTERISTICS")
monitor.setCursorPos(30,9)
monitor.write("PHYSICAL CHARACTERISTICS")
monitor.setCursorPos(30,15)
monitor.write("ATMOSPHERE")
monitor.setTextColor(colors.white)
monitor.setCursorPos(30,4)
monitor.write("Aphelion: 152.098.232 Km")
monitor.setCursorPos(30,5)
monitor.write("Perihelion: 147.098.290 Km")
monitor.setCursorPos(30,6)
monitor.write("Orbital Period: 365 days")
monitor.setCursorPos(30,7)
monitor.write("Satellite: YES (1)")
monitor.setCursorPos(30,10)
monitor.write("Mean Radius: 6.371 Km")
monitor.setCursorPos(30,11)
monitor.write("Surface Gravity: 1g (100%)")
monitor.setCursorPos(30,12)
monitor.write("Rotation Period: 24h")
monitor.setCursorPos(30,13)
monitor.write("Mean Temperature: 15 C")
monitor.setCursorPos(30,16)
monitor.write("Nitrogen 78%, Oxygen 21%")
monitor.setCursorPos(30,17)
monitor.write("Water Vapor 1%")
monitor.setCursorPos(30,18)
monitor.write("Traces of Argon and CO2")
image = paintutils.loadImage("mars.nfp")
paintutils.drawImage(image,2,5)
term.redirect(term.native())
end

function Info_Twilight()
term.redirect(monitor)
monitor.clear()
monitor.setCursorPos(6,20)
monitor.write("TWILIGHT FOREST")
monitor.setCursorPos(4,21)
monitor.write("(Extradimensional Realm)")
monitor.setTextColor(colors.cyan)
monitor.setCursorPos(30,3)
monitor.write("CHARACTERISTICS")
monitor.setCursorPos(30,9)
monitor.write("PHYSICAL CHARACTERISTICS")
monitor.setCursorPos(30,15)
monitor.write("ATMOSPHERE")
monitor.setTextColor(colors.white)
monitor.setCursorPos(25,4)
monitor.write("Nearly all of the Twilight Forest is")
monitor.setCursorPos(25,5)
monitor.write("densely forested.")
monitor.setCursorPos(30,6)
monitor.write("Orbital Period: 365 days")
monitor.setCursorPos(30,7)
monitor.write("Satellite: YES (1)")
monitor.setCursorPos(30,10)
monitor.write("Mean Radius: 6.371 Km")
monitor.setCursorPos(30,11)
monitor.write("Surface Gravity: 1g (100%)")
monitor.setCursorPos(30,12)
monitor.write("Rotation Period: 24h")
monitor.setCursorPos(30,13)
monitor.write("Mean Temperature: 15 C")
monitor.setCursorPos(30,16)
monitor.write("Nitrogen 78%, Oxygen 21%")
monitor.setCursorPos(30,17)
monitor.write("Water Vapor 1%")
monitor.setCursorPos(30,18)
monitor.write("Traces of Argon and CO2")
image = paintutils.loadImage("earth.nfp")
paintutils.drawImage(image,2,5)
term.redirect(term.native())
end

function split(str, delim, maxNb)
  -- Eliminate bad cases...
  if string.find(str, delim) == nil then
    return { str }
  end
  if maxNb == nil or maxNb < 1 then
    maxNb = 0    -- No limit
  end
  local result = {}
  local nb = 0
  local lastPos
  local working = str
  local continue = true
  while continue do
    local i = string.find(working, delim)
    if i == nil then
      break
    end
  --  print("Delimeter found at position "..i)
    local part = string.sub(working, 1, i-1)
    nb = nb + 1
  --  print("part "..nb..": "..part)
    working = string.sub(working, i+1)
  --  print("Remaining: "..working)
    result[nb] = part
    if nb == maxNb then break end
  end
  -- Handle the last field
  if nb ~= maxNb then
    result[nb + 1] = working
  end
  --for count = 1, #result do
  -- print(result[count])
  --end
  return result
end

while true do
rednet.open("back")
    local id, msg, dis = rednet.receive()
    print("message received: "..msg)
    local msgArr = split(msg, "|", 0)
	print("Message array:")
    for i=1,#msgArr do
     print(i..": "..msgArr[i])
    end
	
	
	
    if msgArr[2] == "Earth" then
	  Info_Tierra()
	end
	if msgArr[2] == "Mars" then
	  Info_Mars()
	end
    if msgArr[2] == "Twilight Forest" then
	  Info_Twilight()
	end
	if msgArr[1] == "ping" then
      print("Receieve ping from #"..id)
      rednet.send(id,"pong")
    end
end
