require("mods/map/celestialPosition.lua")

function AddSolPlanets()
    -- Stern und Planeten -- Die Artefakte dienen zur lesbarkeit auf den Radarschirmen.
    planetSize()
    local centreposition = {120000,0}

    size = 0.04
    sol_system = {}

    sun1 = Planet():setPosition(centreposition[1], centreposition[2]):setPlanetRadius(size*sun):setPlanetSurfaceTexture("planets/sun.jpg"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(1,0.5,0):setAxialRotationTime(1000)
    sol_system[1] = sun1
    sun2 = Artifact():setPosition(centreposition[1], centreposition[2]):setModel("SensorBuoyMKI"):setCallSign("Sol"):setDescription("Stern: Sol. Im allgemeinen auch als Sonne bezeichnet."):setScanningParameters(1, 1):setRadarSignatureInfo(1.0, 1.0, 0)
    sol_system[2] = sun2

    merkur1 = Planet():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dmerkur, 230)):setPlanetRadius(size*merkur):setPlanetSurfaceTexture("planets/merkur.png")
    sol_system[3] = merkur1
    merkur2 = Artifact():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dmerkur, 230)):setModel("SensorBuoyMKI"):setCallSign("Merkur"):setDescription("Planet: Merkur."):setScanningParameters(1, 1):setRadarSignatureInfo(0.1, 0.1, 0)
    sol_system[4] = merkur2

    venus1 = Planet():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dvenus, 50)):setPlanetRadius(size*venus):setPlanetSurfaceTexture("planets/venus-5.png"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.1,0.1,0.1):setAxialRotationTime(2000.0)
    sol_system[5] = venus1
    venus2 = Artifact():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dvenus, 50)):setModel("SensorBuoyMKI"):setCallSign("Venus"):setDescription("Planet: Venus."):setScanningParameters(1, 1):setRadarSignatureInfo(0.5, 0.5, 0)
    sol_system[6] = venus2

    earth1 = Planet():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dearth, 180)):setPlanetRadius(size*earth):setPlanetSurfaceTexture("planets/planet-earth.png"):setPlanetCloudTexture("planets/clouds-2.png"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.2,0.2,1.0):setAxialRotationTime(1000.0)
    sol_system[7] = earth1
    earth2 = Artifact():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dearth, 180)):setModel("SensorBuoyMKI"):setCallSign("Terra"):setDescription("Planet: Erde. Von manchen Religi�sen auch Gaia genannt."):setScanningParameters(1, 1):setRadarSignatureInfo(0, 0, 1.0)
    sol_system[8] = earth2
    moon1 = Planet():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], dearth, 180, dmoon, 125)):setPlanetRadius(size*moon):setPlanetSurfaceTexture("planets/moon-2.png")
    sol_system[9] = moon1
    moon2 = Artifact():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], dearth, 180, dmoon, 125)):setModel("SensorBuoyMKI"):setCallSign("TN C&C"):setDescription("Mond. \n\n Auf dem Trabanten der Erde befindet sich die ausgelagerte Basis der Terranischen Navy. Von hier steuert und �berwacht die Admiralit�t die Terranische Flotte."):setScanningParameters(1, 0):setRadarSignatureInfo(0.1, 0.1, 0)
    sol_system[10] = moon2

    mars1 = Planet():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dmars, 310)):setCallSign("Mars Comm-Link-Station"):setPlanetRadius(size*mars):setPlanetSurfaceTexture("planets/mars.jpeg"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.1,0.1,0.1):setAxialRotationTime(1000.0)
    sol_system[11] = mars1
    mars2 = Artifact():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dmars, 310)):setModel("SensorBuoyMKI"):setCallSign("Mars"):setDescription("Planet: Mars."):setScanningParameters(1, 1):setRadarSignatureInfo(0.4, 0.4, 0)
    sol_system[12] = mars2
    phobos = Asteroid():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], dmars, 310, 2000, 125)):setSize(150)
    sol_system[23] = phobos
    deimos = Asteroid():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], dmars, 310, 1500, 60)):setSize(100)
    sol_system[24] = deimos

    ceres = Planet():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], 2.5*au, 120)):setPlanetRadius(size*moon*0.5):setPlanetSurfaceTexture("planets/moon-2.png")
    sol_system[25] = ceres
    ceres2 = Artifact():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], 2.5*au, 120)):setModel("SensorBuoyMKI"):setCallSign("Ceres")
    sol_system[26] = ceres2

    jupiter1 = Planet():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], djupiter, 15)):setPlanetRadius(size*jupiter):setPlanetSurfaceTexture("planets/jupiter.jpg"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.1,0.1,0.1):setAxialRotationTime(500.0)
    sol_system[13] = jupiter1
    jupiter2 = Artifact():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], djupiter, 15)):setModel("SensorBuoyMKI"):setCallSign("Jupiter"):setDescription("Planet: Jupiter."):setScanningParameters(1, 1):setRadarSignatureInfo(0.9, 0.9, 0)
    sol_system[14] = jupiter2
    moonIo1 = Planet():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], djupiter, 15, 7000, 75)):setPlanetRadius(size*moonIo):setPlanetSurfaceTexture("planets/moon-1.png")
    sol_system[27] = moonIo1
    moonIo2 = Artifact():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], djupiter, 15, 7000, 75)):setModel("SensorBuoyMKI"):setCallSign("Io"):setRadarSignatureInfo(0.1, 0.1, 0)
    sol_system[28] = moonIo2
    moonEuropa1 = Planet():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], djupiter, 15, 8500, 240)):setPlanetRadius(size*moonEuropa):setPlanetSurfaceTexture("planets/moon-3.png")
    sol_system[29] = moonEuropa1
    moonEuropa2 = Artifact():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], djupiter, 15, 8500, 240)):setModel("SensorBuoyMKI"):setCallSign("Europa"):setRadarSignatureInfo(0.1, 0.1, 0)
    sol_system[30] = moonEuropa2
    moonGanymed1 = Planet():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], djupiter, 15, 9000, 140)):setPlanetRadius(size*moonGanymed):setPlanetSurfaceTexture("planets/merkur.png")
    sol_system[31] = moonGanymed1
    moonGanymed2 = Artifact():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], djupiter, 15, 9000, 140)):setModel("SensorBuoyMKI"):setCallSign("Ganymed"):setRadarSignatureInfo(0.1, 0.1, 0)
    sol_system[32] = moonGanymed2
    moonCallisto1 = Planet():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], djupiter, 15, 10500, 10)):setPlanetRadius(size*moonCallisto):setPlanetSurfaceTexture("planets/moon-1.png")
    sol_system[31] = moonCallisto1
    moonCallisto2 = Artifact():setPosition(placeMoonAroundObject(centreposition[1], centreposition[2], djupiter, 15, 10500, 10)):setModel("SensorBuoyMKI"):setCallSign("Callisto"):setRadarSignatureInfo(0.1, 0.1, 0)
    sol_system[32] = moonCallisto2

    saturn1 = Planet():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dsaturn, 240)):setPlanetRadius(size*saturn):setPlanetSurfaceTexture("planets/saturn.jpg"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.1,0.1,0.1):setAxialRotationTime(200.0)
    sol_system[15] = saturn1
    saturn2 = Artifact():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dsaturn, 240)):setModel("SensorBuoyMKI"):setCallSign("Saturn"):setDescription("Planet: Saturn."):setScanningParameters(1, 1):setRadarSignatureInfo(0.8, 0.8, 0)
    sol_system[16] = saturn2
    uranus1 = Planet():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], duranus, 165)):setPlanetRadius(size*uranus):setPlanetSurfaceTexture("planets/uranus.jpg"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.1,0.1,0.1):setAxialRotationTime(200.0)
    sol_system[17] = uranus1
    uranus2 = Artifact():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], duranus, 165)):setModel("SensorBuoyMKI"):setCallSign("Uranus"):setDescription("Planet: Uranus."):setScanningParameters(1, 1):setRadarSignatureInfo(0.7, 0.7, 0)
    sol_system[18] = uranus2
    neptun1 = Planet():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dneptun, 0)):setPlanetRadius(size*neptun):setPlanetSurfaceTexture("planets/neptune.jpg"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.1,0.1,0.1):setAxialRotationTime(200.0)
    sol_system[19] = neptun1
    neptun2 = Artifact():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dneptun, 0)):setModel("SensorBuoyMKI"):setCallSign("Neptun"):setDescription("Planet: Neptun."):setScanningParameters(1, 1):setRadarSignatureInfo(0.7, 0.7, 0)
    sol_system[20] = neptun2
    pluto1 = Planet():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dpluto, 270)):setPlanetRadius(size*pluto):setPlanetSurfaceTexture("planets/pluto.jpg"):setAxialRotationTime(100.0)
    sol_system[21] = pluto1
    pluto2 = Artifact():setPosition(calculateOrbitPosition(centreposition[1], centreposition[2], dpluto, 270)):setModel("SensorBuoyMKI"):setCallSign("Pluto"):setDescription("Planet: Pluto."):setScanningParameters(1, 1):setRadarSignatureInfo(0.1, 0.1, 0)
    sol_system[22] = pluto2
    -- Stern und Planeten Ende
end

planetSize = function()
    sun = 1390000/7
    merkur = 4900
    venus = 12100
    earth = 12800
    moon = 3475
    mars = 6800
    jupiter = 143000
    moonIo = 3643
    moonEuropa = 3121
    moonGanymed = 5268
    moonCallisto = 4820
    saturn = 120500
    uranus = 51100
    neptun  = 49500
    pluto = 2376
end

au = 149597870*0.0002
dsun = 0*au
dmerkur = 0.39*au
dvenus = 0.72*au
dearth = 1*au
dmoon = 0.075*au
dmars = 1.52*au
djupiter = 5.2*au
dsaturn = 9.53*au*0.75
duranus = 19.2*au*0.5
dneptun = 30.1*au*0.4
dpluto = 39.5*au*0.3