package.path = package.path .. ";/code/modules/?.lua"
local utils = require("utils")
local Navigation = require("Navigation")

utils.equip_tool()

-- Navigation:init(58, -1, -40, "north")
-- for i = 1, 10 do
--     Navigation:moveUp()
--     Navigation:logPosition()
-- end
-- for i = 1, 10 do
--     Navigation:moveDown()
--     Navigation:logPosition()
-- end
-- Navigation:logPosition()

Navigation:init(58, -1, -40, "north")
print(Navigation:getPosition().y)
