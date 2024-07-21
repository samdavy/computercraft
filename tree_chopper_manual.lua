function equip()
  for i = 1, 16 do
    tool_slot = 1
    curr_item = turtle.getItemDetail(i).name
    if curr_item == "minecraft:diamond_axe" || curr_item == "minecraft:diamond_pickaxe" || curr_item == "minecraft:diamond_shovel" || curr_item == "minecraft:diamond_hoe" || curr_item == "minecraft:diamond_sword" then
      tool_slot = i
      turtle.equipLeft(tool_slot)
      return 0
      break
    end
  return 1
end
