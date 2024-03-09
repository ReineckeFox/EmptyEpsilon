-- Assuming 'asteroidbelts' table is used to store asteroid belts as a global variable
asteroidbelts = {}

function createAsteroidBelt(centerX, centerY, beltRadius, beltWidth, numberOfAsteroids, sizeOfAsteroids)
    local asteroidObjects = {}
    for _ = 1, numberOfAsteroids do
        local angle = math.rad(math.random(0, 360)) -- Random angle in radians
        local distance = math.random(beltRadius - beltWidth/2, beltRadius + beltWidth/2) -- Distance within the belt width

        local asteroidX = centerX + distance * math.cos(angle)
        local asteroidY = centerY + distance * math.sin(angle)

        local asteroid = Asteroid():setPosition(asteroidX, asteroidY):setSize(sizeOfAsteroids)
        table.insert(asteroidObjects, asteroid)
    end

    -- Store the asteroid objects in the 'asteroidbelts' table
    table.insert(asteroidbelts, asteroidObjects)
end