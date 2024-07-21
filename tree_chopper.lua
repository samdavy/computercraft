-- Constants
local START_X, START_Y, START_Z = 41, 93, -239
local END_X, END_Y, END_Z = 58, 93, -222
local SAPLING_Y = 93  -- The Y-level where saplings are planted

-- Starting position
local currentX, currentY, currentZ = START_X, START_Y, START_Z

-- Function to move forward and update position
function moveForward()
    if turtle.forward() then
        currentZ = currentZ + 1
    end
end

-- Function to move back and update position
function moveBack()
    if turtle.back() then
        currentZ = currentZ - 1
    end
end

-- Function to move up and update position
function moveUp()
    if turtle.up() then
        currentY = currentY + 1
    end
end

-- Function to move down and update position
function moveDown()
    if turtle.down() then
        currentY = currentY - 1
    end
end

-- Function to move left and update position
function moveLeft()
    turtle.turnLeft()
    moveForward()
    turtle.turnRight()
end

-- Function to move right and update position
function moveRight()
    turtle.turnRight()
    moveForward()
    turtle.turnLeft()
end

-- Function to move to a specific coordinate
function moveTo(x, y, z)
    -- Move in Y direction first
    while currentY ~= y do
        if currentY < y then
            moveUp()
        else
            moveDown()
        end
    end

    -- Move in X direction second
    while currentX ~= x do
        if currentX < x then
            moveRight()
        else
            moveLeft()
        end
    end
    
    -- Move in Z direction last
    while currentZ ~= z do
        if currentZ < z then
            moveForward()
        else
            moveBack()
        end
    end
end

-- Function to chop a tree
function chopTree()
    while turtle.detect() do
        turtle.dig()
        moveUp()
    end
    
    -- Move back down
    while not turtle.detectDown() do
        moveDown()
    end
end

-- Function to collect saplings
function collectSaplings()
    for x = START_X, END_X do
        for z = START_Z, END_Z do
            moveTo(x, SAPLING_Y, z)
            turtle.suckDown()
        end
    end
end

-- Function to plant saplings
function plantSaplings()
    for x = START_X, END_X do
        for z = START_Z, END_Z do
            moveTo(x, SAPLING_Y, z)
            turtle.placeDown()
        end
    end
end

-- Main function
function main()
    while true do
        -- Chop all trees in the range
        for x = START_X, END_X do
            for z = START_Z, END_Z do
                for y = START_Y, END_Y do
                    moveTo(x, y, z)
                    if turtle.detect() then
                        chopTree()
                    end
                end
            end
        end
        
        -- Collect saplings
        collectSaplings()
        
        -- Plant saplings
        plantSaplings()
        
        -- Wait for trees to grow
        os.sleep(600)  -- Wait for 10 minutes (adjust as needed)
    end
end

-- Run the main function
main()

