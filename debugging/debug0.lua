package.path = package.path .. ";/code/modules/?.lua"
local utils = require("utils")
local Navigator = require("Navigator")

utils.equip_tool()

utils.test_function()

Navigation:init(58, -1, -40, "north")
for i = 1, 10 do
    Navigation:moveUp()
    Navigation:logPosition()
end
for i = 1, 10 do
    Navigation:moveDown()
    Navigation:logPosition()
end
Navigation:logPosition()

local nav0 = Navigator:new(0, 0, 0, "north")

print(nav0.__index)

