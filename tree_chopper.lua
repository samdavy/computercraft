-- 41, 93, -239
-- 58, 93, -222
-- 41, 109, -239

-- Constants
local START_X, START_Y, START_Z = 41, 93, -239
local END_X, END_Y, END_Z = 58, 93, -222
local SAPLING_Y = 93  -- The Y-level where saplings are planted

-- Function to move to a specific coordinate
function moveTo(x, y, z)
    local currentX, currentY, currentZ = gps.locate()
    
    -- Move in X direction
    while currentX ~= x do
        if currentX < x then
            turtle.forward()
        else
            turtle.back()
        end
        currentX, currentY, currentZ = gps.locate()
    end
    
    -- Move in Y direction
    while currentY ~= y do
        if currentY < y then
            turtle.up()
        else
            turtle.down()
        end
        currentY = gps.locate()
    end
    
    -- Move in Z direction
    while currentZ ~= z do
        if currentZ < z then
            turtle.forward()
        else
            turtle.back()
        end
        currentX, currentY, currentZ = gps.locate()
    end
end

-- Function to chop a tree
function chopTree()
    while turtle.detect() do
        turtle.dig()
        turtle.up()
    end
    
    -- Move back down
    while not turtle.detectDown() do
        turtle.down()
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
