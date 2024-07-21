function clear_plane(x, y)
    for i = 1, x do
	for j = 1, y-1 do
	    turtle.dig()
	    turtle.forward()
	end
	if i >= x then
	    break
	else
	    if i % 2 == 1 then
		turtle.turnRight()
		turtle.dig()
		turtle.forward()
		turtle.turnRight()
	    else
		turtle.turnLeft()
		turtle.dig()
		turtle.forward()
		turtle.turnLeft()
	    end
	end
    end
end

function clear_3d(x, y, z)
    turtle.select(1)
    turtle.equipLeft()
    turtle.digDown()
    turtle.down()
    for i = 1, z do
	clear_plane(x, y)
	turtle.turnRight()
	turtle.turnRight()
	if i < z then
	    turtle.digDown()
	    turtle.down()
	end
    end
end

-- main function
clear_3d(9, 9, 2)
