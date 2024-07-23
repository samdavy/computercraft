local Navigation = {
    position = {x = 0, y = 0, z = 0, facing = "north"}
}
Navigation.__index = Navigation

function Navigation:init(x, y, z, facing)
    self.position.x = x or 0
    self.position.y = y or 0
    self.position.z = z or 0
    self.position.facing = facing or "north"
end

function Navigation:getPosition()
    return {
        x = self.position.x,
        y = self.position.y,
        z = self.position.z,
        facing = self.position.facing
    }
end

function Navigation:logPosition()
    print("Position: x=" .. self.position.x .. ", y=" .. self.position.y .. ", z=" .. self.position.z .. ", facing=" .. self.position.facing)
end

function Navigation:moveUp()
    if turtle.up() then
        self.position.y = self.position.y + 1
        return true
    else
        return false
    end
end

function Navigation:moveDown()
    if turtle.down() then
        self.position.y = self.position.y - 1
        return true
    else
        return false
    end
end

function Navigation:moveForward()
    if turtle.forward() then
        if self.position.facing == "north" then
            self.position.z = self.position.z - 1
        elseif self.position.facing == "south" then
            self.position.z = self.position.z + 1
        elseif self.position.facing == "east" then
            self.position.x = self.position.x + 1
        elseif self.position.facing == "west" then
            self.position.x = self.position.x - 1
        end
        return true
    else
        return false
    end
end

function Navigation:moveBack()
    if turtle.back() then
        if self.position.facing == "north" then
            self.position.z = self.position.z + 1
        elseif self.position.facing == "south" then
            self.position.z = self.position.z - 1
        elseif self.position.facing == "east" then
            self.position.x = self.position.x - 1
        elseif self.position.facing == "west" then
            self.position.x = self.position.x + 1
        end
        return true
    else
        return false
    end
end

function Navigation:turnLeft()
    turtle.turnLeft()
    if self.position.facing == "north" then
        self.position.facing = "west"
    elseif self.position.facing == "west" then
        self.position.facing = "south"
    elseif self.position.facing == "south" then
        self.position.facing = "east"
    elseif self.position.facing == "east" then
        self.position.facing = "north"
    end
end

function Navigation:turnRight()
    turtle.turnRight()
    if self.position.facing == "north" then
        self.position.facing = "east"
    elseif self.position.facing == "east" then
        self.position.facing = "south"
    elseif self.position.facing == "south" then
        self.position.facing = "west"
    elseif self.position.facing == "west" then
        self.position.facing = "north"
    end
end

function Navigation:turnToFace(direction)
    while self.position.facing ~= direction do
        turtle.turnRight()
        if self.position.facing == "north" then
            self.position.facing = "east"
        elseif self.position.facing == "east" then
            self.position.facing = "south"
        elseif self.position.facing == "south" then
            self.position.facing = "west"
        elseif self.position.facing == "west" then
            self.position.facing = "north"
        end
    end
end

return Navigation
