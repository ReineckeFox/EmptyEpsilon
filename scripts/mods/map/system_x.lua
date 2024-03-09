require("mods/map/celestialPosition.lua")
require("mods/map/asteroidbelt.lua")

systemX = function()
    local centerposition = {0,0}
    Planet():setPosition(centerposition[1], -5000):setPlanetRadius(8000):setPlanetSurfaceTexture("planets/sun_yellow.png"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(1,0.5,0):setAxialRotationTime(1000)
    Planet():setPosition(centerposition[1], 9000):setPlanetRadius(3000):setPlanetSurfaceTexture("planets/sun_lightblue.png"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0,0,1):setAxialRotationTime(100)
    Nebula():setPosition(centerposition[1], -5000)
    local sdx1 = 20000
    local spx1 = 230
    Planet():setPosition(calculateOrbitPosition(centerposition[1], centerposition[2], sdx1, spx1)):setPlanetRadius(500):setPlanetSurfaceTexture("planets/rocky_1_lava.png"):setAxialRotationTime(300)
    Artifact():setPosition(calculateOrbitPosition(centerposition[1], centerposition[2], sdx1, spx1)):setModel("SensorBuoyMKI"):setCallSign("X1"):setDescription("Planet: X1."):setScanningParameters(1, 1):setRadarSignatureInfo(0.1, 0.1, 0)

    Planet():setPosition(calculateOrbitPosition(centerposition[1], centerposition[2], 60000, 45)):setPlanetRadius(1000):setPlanetSurfaceTexture("planets/desert.png"):setAxialRotationTime(400)
    Artifact():setPosition(calculateOrbitPosition(centerposition[1], centerposition[2], 60000, 45)):setModel("SensorBuoyMKI"):setCallSign("X2"):setDescription("Planet: X2."):setScanningParameters(1, 1):setRadarSignatureInfo(0.1, 0.1, 0)

    Planet():setPosition(calculateOrbitPosition(centerposition[1], centerposition[2], 100000, 120)):setPlanetRadius(2500):setPlanetSurfaceTexture("planets/gas_yellow.png"):setAxialRotationTime(800)
    Artifact():setPosition(calculateOrbitPosition(centerposition[1], centerposition[2], 100000, 120)):setModel("SensorBuoyMKI"):setCallSign("X3"):setDescription("Planet: X3."):setScanningParameters(1, 1):setRadarSignatureInfo(0.1, 0.1, 0)

    -- Asteroid Group
    -- Distance to Systemcenter: 120000
    asteroidGroupSystemX()

    Nebula():setPosition(87858, -65077)
    Nebula():setPosition(95522, -58753)
    Nebula():setPosition(81530, -73374)
    Nebula():setPosition(110239, -50209)
    Nebula():setPosition(105341, -59378)
    Nebula():setPosition(106011, -70441)
    Nebula():setPosition(105716, -79809)
    Nebula():setPosition(95175, -83354)
    Nebula():setPosition(84022, -82351)
    Nebula():setPosition(76855, -90070)
    -- Asteroid Group end

    -- Asteroid Belts
    createAsteroidBelt(0, 0, 30000,3000, 300, 100)
    createAsteroidBelt(0, 0, 160000,6000, 500, 100)
    -- Asteroid Belts end

    Planet():setPosition(calculateOrbitPosition(centerposition[1], centerposition[2], 140000, 320)):setPlanetRadius(2500):setPlanetSurfaceTexture("planets/gas_yellow.png"):setAxialRotationTime(800)
    Artifact():setPosition(calculateOrbitPosition(centerposition[1], centerposition[2], 140000, 320)):setModel("SensorBuoyMKI"):setCallSign("X3"):setDescription("Planet: X3."):setScanningParameters(1, 1):setRadarSignatureInfo(0.1, 0.1, 0)

end

asteroidGroupSystemX = function()
    Asteroid():setPosition(100668, -75513):setSize(118)
    Asteroid():setPosition(101461, -73134):setSize(124)
    Asteroid():setPosition(105108, -73375):setSize(127)
    Asteroid():setPosition(104391, -75927):setSize(113)
    Asteroid():setPosition(102783, -70173):setSize(126)
    Asteroid():setPosition(102941, -70649):setSize(120)
    Asteroid():setPosition(101250, -73821):setSize(118)
    Asteroid():setPosition(101197, -72764):setSize(130)
    Asteroid():setPosition(106943, -66676):setSize(118)
    Asteroid():setPosition(100448, -72452):setSize(125)
    Asteroid():setPosition(96012, -70315):setSize(117)
    Asteroid():setPosition(96480, -73145):setSize(118)
    Asteroid():setPosition(96223, -72060):setSize(125)
    Asteroid():setPosition(96223, -71848):setSize(129)
    Asteroid():setPosition(96384, -71701):setSize(117)
    Asteroid():setPosition(92738, -74297):setSize(112)
    Asteroid():setPosition(92738, -73610):setSize(115)
    Asteroid():setPosition(95963, -66208):setSize(118)
    Asteroid():setPosition(96016, -67583):setSize(115)
    Asteroid():setPosition(97760, -67265):setSize(110)
    Asteroid():setPosition(96858, -70315):setSize(116)
    Asteroid():setPosition(97228, -71372):setSize(118)
    Asteroid():setPosition(99855, -73677):setSize(121)
    Asteroid():setPosition(99961, -73095):setSize(127)
    Asteroid():setPosition(99062, -73518):setSize(123)
    Asteroid():setPosition(98586, -72884):setSize(119)
    Asteroid():setPosition(95364, -75593):setSize(111)
    Asteroid():setPosition(95787, -75804):setSize(111)
    Asteroid():setPosition(100668, -63194):setSize(123)
    Asteroid():setPosition(100404, -62137):setSize(122)
    Asteroid():setPosition(102043, -62190):setSize(115)
    Asteroid():setPosition(102466, -61238):setSize(119)
    Asteroid():setPosition(102466, -62824):setSize(124)
    Asteroid():setPosition(97919, -65996):setSize(129)
    Asteroid():setPosition(98342, -66155):setSize(113)
    Asteroid():setPosition(99082, -63142):setSize(130)
    Asteroid():setPosition(100351, -63776):setSize(121)
    Asteroid():setPosition(103680, -61954):setSize(121)
    Asteroid():setPosition(104263, -61556):setSize(120)
    Asteroid():setPosition(105268, -62609):setSize(127)
    Asteroid():setPosition(103999, -64516):setSize(121)
    Asteroid():setPosition(104369, -65362):setSize(119)
    Asteroid():setPosition(104226, -65638):setSize(117)
    Asteroid():setPosition(103840, -67424):setSize(123)
    Asteroid():setPosition(105821, -58679):setSize(115)
    Asteroid():setPosition(105902, -60075):setSize(111)
    Asteroid():setPosition(105666, -56345):setSize(125)
    Asteroid():setPosition(106787, -58920):setSize(129)
    Asteroid():setPosition(106878, -57358):setSize(129)
    Asteroid():setPosition(104845, -60022):setSize(112)
    Asteroid():setPosition(107341, -61812):setSize(112)
    Asteroid():setPosition(110133, -60616):setSize(116)
    Asteroid():setPosition(106772, -54397):setSize(110)
    Asteroid():setPosition(105164, -57541):setSize(117)
    Asteroid():setPosition(104552, -57728):setSize(113)
    Asteroid():setPosition(99606, -58143):setSize(113)
    Asteroid():setPosition(104105, -58648):setSize(127)
    Asteroid():setPosition(108859, -46422):setSize(119)
    Asteroid():setPosition(109636, -53105):setSize(113)
    Asteroid():setPosition(115852, -46889):setSize(118)
    Asteroid():setPosition(113987, -40051):setSize(121)
    Asteroid():setPosition(76123, -88979):setSize(125)
    Asteroid():setPosition(78516, -88421):setSize(123)
    Asteroid():setPosition(80111, -86427):setSize(127)
    Asteroid():setPosition(82914, -85394):setSize(121)
    Asteroid():setPosition(81080, -88493):setSize(116)
    Asteroid():setPosition(76322, -85366):setSize(116)
    Asteroid():setPosition(79234, -90494):setSize(117)
    Asteroid():setPosition(79336, -90608):setSize(129)
    Asteroid():setPosition(77639, -91531):setSize(128)
    Asteroid():setPosition(82326, -90664):setSize(123)
    Asteroid():setPosition(80340, -91771):setSize(119)
    Asteroid():setPosition(71137, -92529):setSize(114)
    Asteroid():setPosition(88754, -80967):setSize(116)
    Asteroid():setPosition(89432, -81907):setSize(112)
    Asteroid():setPosition(88193, -82767):setSize(116)
    Asteroid():setPosition(81905, -84728):setSize(125)
    Asteroid():setPosition(81083, -81961):setSize(111)
    Asteroid():setPosition(88524, -86403):setSize(119)
    Asteroid():setPosition(88159, -84129):setSize(126)
    Asteroid():setPosition(87611, -81551):setSize(123)
    Asteroid():setPosition(87400, -81287):setSize(118)
    Asteroid():setPosition(87135, -82662):setSize(116)
    Asteroid():setPosition(86924, -82609):setSize(128)
    Asteroid():setPosition(86783, -84055):setSize(116)
    Asteroid():setPosition(86373, -81971):setSize(130)
    Asteroid():setPosition(84696, -81538):setSize(118)
    Asteroid():setPosition(84736, -83980):setSize(117)
    Asteroid():setPosition(84550, -84985):setSize(110)
    Asteroid():setPosition(85887, -83957):setSize(111)
    Asteroid():setPosition(85964, -83088):setSize(115)
    Asteroid():setPosition(91656, -77206):setSize(114)
    Asteroid():setPosition(91892, -76993):setSize(125)
    Asteroid():setPosition(91257, -75354):setSize(126)
    Asteroid():setPosition(92180, -77288):setSize(114)
    Asteroid():setPosition(92040, -78707):setSize(120)
    Asteroid():setPosition(88508, -75936):setSize(126)
    Asteroid():setPosition(90623, -73980):setSize(116)
    Asteroid():setPosition(90729, -83232):setSize(111)
    Asteroid():setPosition(91758, -83152):setSize(130)
    Asteroid():setPosition(91416, -75301):setSize(119)
    Asteroid():setPosition(91945, -75301):setSize(118)
    Asteroid():setPosition(84215, -74731):setSize(116)
    Asteroid():setPosition(84215, -74332):setSize(110)
    Asteroid():setPosition(89778, -80597):setSize(128)
    Asteroid():setPosition(87932, -79285):setSize(122)
    Asteroid():setPosition(87900, -77903):setSize(111)
    Asteroid():setPosition(82702, -77152):setSize(125)
    Asteroid():setPosition(82481, -80718):setSize(128)
    Asteroid():setPosition(88218, -78086):setSize(120)
    Asteroid():setPosition(87266, -76870):setSize(130)
    Asteroid():setPosition(88112, -76130):setSize(111)
    Asteroid():setPosition(88402, -74826):setSize(115)
    Asteroid():setPosition(87084, -78263):setSize(130)
    Asteroid():setPosition(87767, -75807):setSize(123)
    Asteroid():setPosition(85804, -79012):setSize(111)
    Asteroid():setPosition(87530, -78932):setSize(120)
    Asteroid():setPosition(93425, -78685):setSize(120)
    Asteroid():setPosition(93901, -77945):setSize(114)
    Asteroid():setPosition(94482, -78579):setSize(121)
    Asteroid():setPosition(94218, -79425):setSize(119)
    Asteroid():setPosition(95032, -76756):setSize(122)
    Asteroid():setPosition(95561, -77020):setSize(112)
    Asteroid():setPosition(95138, -77390):setSize(125)
    Asteroid():setPosition(98025, -76570):setSize(111)
    Asteroid():setPosition(97890, -78094):setSize(114)
    Asteroid():setPosition(97150, -77777):setSize(122)
    Asteroid():setPosition(97256, -77036):setSize(124)
    Asteroid():setPosition(96861, -77363):setSize(116)
    Asteroid():setPosition(96089, -76386):setSize(115)
    Asteroid():setPosition(96597, -78896):setSize(129)
    Asteroid():setPosition(98862, -79881):setSize(119)
    Asteroid():setPosition(98756, -79881):setSize(127)
    Asteroid():setPosition(99635, -78305):setSize(122)
    Asteroid():setPosition(101600, -78559):setSize(120)
    Asteroid():setPosition(99053, -76878):setSize(118)
    Asteroid():setPosition(99897, -77073):setSize(120)
    Asteroid():setPosition(96544, -80800):setSize(120)
    Asteroid():setPosition(101038, -76570):setSize(119)
    Asteroid():setPosition(100285, -49236):setSize(119)
    Asteroid():setPosition(101150, -50163):setSize(127)
    Asteroid():setPosition(99976, -50595):setSize(116)
    Asteroid():setPosition(99544, -52820):setSize(112)
    Asteroid():setPosition(101892, -48309):setSize(116)
    Asteroid():setPosition(103375, -51770):setSize(117)
    Asteroid():setPosition(102572, -52696):setSize(128)
    Asteroid():setPosition(102881, -50163):setSize(117)
    Asteroid():setPosition(104425, -52573):setSize(128)
    Asteroid():setPosition(99482, -47506):setSize(119)
    Asteroid():setPosition(101027, -53500):setSize(118)
    Asteroid():setPosition(100223, -54859):setSize(122)
    Asteroid():setPosition(103128, -54241):setSize(130)
    Asteroid():setPosition(103560, -53500):setSize(120)
    Asteroid():setPosition(103251, -53067):setSize(117)
    Asteroid():setPosition(103313, -45590):setSize(117)
end

