starting_pos = {x = 48, y = 53, z = -27, facing = "south"}
turtle_pos = {x = 48, y = 53, z = -27, facing = "south"}
poi0 = {x = 85, y = 111, z = -82}
y_nav_plane = 210

function move_up()
  if turtle.up() then
    turtle_pos.y = turtle_pos.y + 1
    return true
  else
    return false
  end
end

function move_down()
  if turtle.down() then
    turtle_pos.y = turtle_pos.y - 1
    return true
  else
    return false
  end
end

function move_forward()
  if turtle.forward() then
    if turtle_pos.facing == "north" then
      turtle_pos.z = turtle_pos.z - 1
    elseif turtle_pos.facing == "south" then
      turtle_pos.z = turtle_pos.z + 1
    elseif turtle_pos.facing == "east" then
      turtle_pos.x = turtle_pos.x + 1
    elseif turtle_pos.facing == "west" then
      turtle_pos.x = turtle_pos.x - 1
    end
    return true
  else
    return false
  end
end

function move_back()
  if turtle.back() then
    if turtle_pos.facing == "north" then
      turtle_pos.z = turtle_pos.z + 1
    elseif turtle_pos.facing == "south" then
      turtle_pos.z = turtle_pos.z - 1
    elseif turtle_pos.facing == "east" then
      turtle_pos.x = turtle_pos.x - 1
    elseif turtle_pos.facing == "west" then
      turtle_pos.x = turtle_pos.x + 1
    end
    return true
  else
    return false
  end
end

function turn_to_face(direction)
    while turtle_pos.facing ~= direction do
        turtle.turnRight()
        if turtle_pos.facing == "north" then
            turtle_pos.facing = "east"
        elseif turtle_pos.facing == "east" then
            turtle_pos.facing = "south"
        elseif turtle_pos.facing == "south" then
            turtle_pos.facing = "west"
        elseif turtle_pos.facing == "west" then
            turtle_pos.facing = "north"
        end
    end
end

function find_path(start, destination)
    local path = {}
    local current = {x = start.x, y = start.y, z = start.z}
    
    -- Move up to navigation plane
    while current.y < y_nav_plane do
        table.insert(path, {action = "up"})
        current.y = current.y + 1
    end
    
    -- Navigate on the plane
    while current.x ~= destination.x or current.z ~= destination.z do
        if current.x < destination.x then
            table.insert(path, {action = "east"})
            current.x = current.x + 1
        elseif current.x > destination.x then
            table.insert(path, {action = "west"})
            current.x = current.x - 1
        elseif current.z < destination.z then
            table.insert(path, {action = "south"})
            current.z = current.z + 1
        elseif current.z > destination.z then
            table.insert(path, {action = "north"})
            current.z = current.z - 1
        end
    end
    
    -- Move down to destination
    while current.y > destination.y do
        table.insert(path, {action = "down"})
        current.y = current.y - 1
    end
    
    return path
end

function travel(path)
    for _, step in ipairs(path) do
        if step.action == "up" then
            move_up()
        elseif step.action == "down" then
            move_down()
        elseif step.action == "forward" then
            move_forward()
        elseif step.action == "back" then
            move_back()
        elseif step.action == "north" or step.action == "south" or step.action == "east" or step.action == "west" then
            turn_to_face(step.action)
            move_forward()
        end
    end
end

local path = find_path(starting_pos, poi0)
travel(path)
sleep(20)
move_forward()
move_forward()
return_path = find_path(turtle_pos, starting_pos)
travel(return_path)
