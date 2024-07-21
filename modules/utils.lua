local utils = {}

function utils.equipTool()
    for i=1, 16 do
      if turtle.getItemDetail(i) then 
        item = turtle.getItemDetail(i).name
        if item == "minecraft:diamond_pickaxe" or item == "minecraft:diamond_axe" or item == "minecraft:diamond_shovel" or item == "minecraft:diamond_sword" or item == "minecraft:diamond_hoe" then
          turtle.select(i)
          turtle.equipLeft()
          return true
        end
      end
    end
end

return utils