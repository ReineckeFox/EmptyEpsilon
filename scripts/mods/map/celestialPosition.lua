function calculateOrbitPosition(x, y, distance, angle)
    -- Convert angle to radians
    local angleInRadians = math.rad(angle)

    -- Calculate new x and y coordinates
    local newX = x + distance * math.cos(angleInRadians)
    local newY = y + distance * math.sin(angleInRadians)

    return newX, newY
end

function placeMoonAroundObject(objectX, objectY, objectDistance, objectAngle, moonDistance, moonAngle)
    -- Calculate object position using the calculateOrbitPosition function
    local objectPositionX, objectPositionY = calculateOrbitPosition(objectX, objectY, objectDistance, objectAngle)

    -- Calculate moon position using the calculateOrbitPosition function
    local moonX, moonY = calculateOrbitPosition(objectPositionX, objectPositionY, moonDistance, moonAngle)

    -- Return the moon position
    return moonX, moonY
end