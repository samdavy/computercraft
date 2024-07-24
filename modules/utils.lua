local utils = {}

function utils.equip_tool()
    for i=1, 16 do
      if turtle.getItemDetail(i) then
        local item0 = turtle.getItemDetail(i).name
        if item0 == "minecraft:diamond_pickaxe" or item0 == "minecraft:diamond_axe" or item0 == "minecraft:diamond_shovel" or item0 == "minecraft:diamond_sword" or item0 == "minecraft:diamond_hoe" then
          turtle.select(i)
          turtle.equipLeft()
          break
        end
      end
    end
    for i=1, 16 do
      if turtle.getItemDetail(i) then
        local item1 = turtle.getItemDetail(i).name
        if item1 == "minecraft:diamond_pickaxe" or item1 == "minecraft:diamond_axe" or item1 == "minecraft:diamond_shovel" or item1 == "minecraft:diamond_sword" or item1 == "minecraft:diamond_hoe" then
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
  local ting = "ting"
  print(ting)
end

return utils
