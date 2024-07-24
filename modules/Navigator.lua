Navigator = {}

function Navigator:new(x, y, z, facing)
  local instance = {}
  setmetatable(instance, self)
  self.__index = self
  instance.position = {
    x = x or 0,
    y = y or 0,
    z = z or 0,
    facing = facing or "north"
  }
  return instance
end

function Navigator:getPosition()
  return {
    x = self.position.x,
    y = self.position.y,
    z = self.position.z,
    facing = self.position.facing
  }
end

function Navigator:logPosition()
  print("Position: x=" .. self.position.x .. ", y=" .. self.position.y .. ", z=" .. self.position.z .. ", facing=" .. self.position.facing)
end

function Navigator:moveUp()
  if turtle.up() then
    self.position.y = self.position.y + 1
    return true
  else
    return false
  end
end

function Navigator:moveDown()
  if turtle.down() then
    self.position.y = self.position.y - 1
    return true
  else
    return false
  end
end

function Navigator:moveForward()
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

function Navigator:moveBack()
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

function Navigator:turnLeft()
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

function Navigator:turnRight()
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

function Navigator:turnToFace(direction)
  while self.position.facing ~= direction do
    self:turnRight()
  end
end

function Navigator:moveToXZ(targetX, targetZ)
  while self.position.x ~= targetX do
    self:logPosition()
    if self.position.x < targetX then
      self:turnToFace("east")
      self:moveForward()
    elseif self.position.x > targetX then
      self:turnToFace("west")
      self:moveForward()
    end
  end

  while self.position.z ~= targetZ do
    self:logPosition()
    if self.position.z < targetZ then
      self:turnToFace("south")
      self:moveForward()
    elseif self.position.z > targetZ then
      self:turnToFace("north")
      self:moveForward()
    end
  end
end

return Navigator
