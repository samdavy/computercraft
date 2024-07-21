-- utils_module.lua

-- Create a table to hold the module's functions and variables
local utils = {}


function utils.equipTool()
    for i=1, 16 do
      item = turtle.getItemDetail(i).name
      -- check if its any diamond tool and equip if it is, else return false
      if item == "minecraft:diamond_pickaxe" or item == "minecraft:diamond_axe" or item == "minecraft:diamond_shovel" or item == "minecraft:diamond_sword" or item == "minecraft:diamond_hoe" then
        turtle.select(i)
        return true
      end
    end
end

return utils