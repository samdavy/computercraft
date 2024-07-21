function equip()
  for i = 1, 16 do
    local curr_item = turtle.getItemDetail(i)
    if curr_item then
      local item_name = curr_item.name
      if item_name == "minecraft:diamond_axe" or item_name == "minecraft:diamond_pickaxe" or 
         item_name == "minecraft:diamond_shovel" or item_name == "minecraft:diamond_hoe" or 
         item_name == "minecraft:diamond_sword" then
        turtle.equipLeft(i)
        return 0
      end
    end
  end
  return 1
end

