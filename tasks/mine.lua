package.path = package.path .. ";/code/modules/?.lua"
local utils = require("utils")
local Navigation = require("Navigation")

utils.equip_tool()

Navigation:init(58, -1, -40, "north")
-- dig until dig returns false
move_down = true
while move_down do
    turtle.digDown()
    move_down = Navigation:moveDown()
    Navigation:logPosition()
end

Navigation:turnRight()

for i = 1, 100 do
  turtle.dig()
  Navigation:moveForward()
  Navigation:logPosition()
end

Navigation:turnLeft()

for i = 1, 100 do
  Navigation:moveBack()
  Navigation:logPosition()
end

while Navigation:moveUp() do
    Navigation:logPosition()
end

Navigation:turnRight()
Navigation:turnRight()
turtle.drop()
Navigation:turnRight()
Navigation:turnRight()
print("Done")
