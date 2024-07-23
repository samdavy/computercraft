local utils = {}

function utils.equip_tool()
    for i=1, 16 do
      if turtle.getItemDetail(i) then 
        item = turtle.getItemDetail(i).name
        if item == "minecraft:diamond_pickaxe" or item == "minecraft:diamond_axe" or item == "minecraft:diamond_shovel" or item == "minecraft:diamond_sword" or item == "minecraft:diamond_hoe" then
          turtle.select(i)
	  turtle.equipLeft()
	  break
        end
      end
    end
    for i=1, 16 do
      if turtle.getItemDetail(i) then 
        item = turtle.getItemDetail(i).name
        if item == "minecraft:diamond_pickaxe" or item == "minecraft:diamond_axe" or item == "minecraft:diamond_shovel" or item == "minecraft:diamond_sword" or item == "minecraft:diamond_hoe" then
          turtle.select(i)
	  turtle.equipRight()
	  turtle.select(1)
          return true
        end
      end
    end
end

function utils.select_item(item)
    for i=1, 16 do
      if turtle.getItemDetail(i) then 
	if turtle.getItemDetail(i).name == item then
	  turtle.select(i)
	  return true
	end
      end
    end
end

function utils.test_function()
  local butt = "hello"
  print(butt)
end

return utils
