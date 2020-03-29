local theBarrel

function attachBarrel()
	local theVehicle = getPedOccupiedVehicle(localPlayer)
	if theVehicle then
		local x,y,z = getElementPosition (theVehicle);
		theBarrel = createObject(1225, x, y, z+2);
		attachElements(theBarrel, theVehicle, 0,-2.9,1.9,272);
	end
end

function throwBarrel()
	local theVehicle = getPedOccupiedVehicle(localPlayer)
	if theVehicle then
		speed = 1
		_,_, rotz = getElementRotation(theVehicle) 
		rotz = math.rad(rotz) 
		vel_x = speed * math.sin(rotz) * -1 
		vel_y = speed * math.cos(rotz) 
		
		detachElements(theBarrel)
		setElementVelocity(theBarrel,vel_x, vel_y, 0.05)
	end
end



addCommandHandler("attachBarrel", attachBarrel)
addCommandHandler("throwbarrel", throwBarrel)