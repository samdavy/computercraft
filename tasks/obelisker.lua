package.path = package.path .. ";/code/modules/?.lua"

local Navigator = require("Navigator")
local utils = require("utils")

utils.test_function()
utils.equip_tool()

local nav0 = Navigator:new(48, 53, -27, "south")
nav0:logPosition()
while nav0.position.y < 319 do
  nav0:logPosition()
  if turtle.detectUp() then
    print("occlusion detected, digging up")
    turtle.digUp()
  end
  if not turtle.detectUp() then
    print("moving up")
    nav0:moveUp()
  end
end
nav0:logPosition()

print("moving to xz pos above obelisk")
local targetX, targetZ = -1, -1  -- Replace with your target coordinates
nav0:moveToXZ(targetX, targetZ)
nav0:logPosition()
print("Reached target position")

print("moving/digging down")

while nav0.position.y > -64 do
  if turtle.detectDown() then
    if not turtle.digDown() then
      nav0:logPosition()
      print("Cant dig further. Stopping.")
      break
    end
  else
    nav0:moveDown()
    nav0:logPosition()
  end
end

print("building obelisk")

while nav0.position.y < 319 do
  nav0:moveUp()
  utils.select_item("minecraft:cobblestone")
  turtle.placeDown()
  nav0:logPosition()
end

print("returning to xz base")

nav0:moveToXZ(48, -27)
nav0:logPosition()

print("docking down")

while nav0.position.y > 53 do
  nav0:moveDown()
  nav0:logPosition()
end




