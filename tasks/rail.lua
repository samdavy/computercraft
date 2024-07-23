package.path = package.path .. ";/code/modules/?.lua"
local utils = require("utils")
local Navigation = require("Navigation")

utils.equip_tool()

for i=1, 1000 do
  turtle.digUp()
  turtle.dig()
  turtle.digDown()
  utils.select_item("minecraft:oak_planks")
  turtle.placeDown()
  turtle.forward()
end
