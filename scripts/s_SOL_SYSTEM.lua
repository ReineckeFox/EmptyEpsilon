-- Name: SOL-System-Beginning
-- Description: Erde und Mars stehen in einem br�chigen Frieden
-- Type: Basic
-- Variation[TN Verdandi]: Erde und Mars stehen in einem br�chigen Frieden - TN Verdandi
-- Variation[TN Leviathan]: Erde und Mars stehen in einem br�chigen Frieden - TN Leviathan
function init()

	if getScenarioVariation() == "TN Verdandi" then
		player = PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("Atlantis"):setPosition(82464, 294):setCallSign("TN Verdandi"):setShieldsMax(100.00, 100.00):setShields(100.00, 100.00):setHullMax(100):setHull(100)
	    for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}) do
			player:setSystemPower(system, 0.0) -- Diese beiden Zeilen setzen die "Leistung" der Systeme auf 0.0, Engineering muss quasi den Motor erstmal starten.
			player:commandSetSystemPowerRequest(system, 0.0)
			player:setWeaponStorage("Homing", 12)
			player:setWeaponStorageMax("Homing", 12)
			player:setWeaponStorage("Nuke", 2)
			player:setWeaponStorageMax("Nuke", 2)
			player:setWeaponStorage("Mine", 2)
			player:setWeaponStorageMax("Mine", 2)
			player:setWeaponStorage("EMP", 2)
			player:setWeaponStorageMax("EMP", 2)
			player:setWeaponStorage("HVLI", 20)
			player:setWeaponStorageMax("HVLI", 20)
		end
	elseif getScenarioVariation() == "TN Leviathan" then
		player = PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("Tr�ger P"):setPosition(82464, 294):setCallSign("TN Leviathan")
	    for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}) do
			--player:setSystemPower(system, 0.0) -- Diese beiden Zeilen setzen die "Leistung" der Systeme auf 0.0, Engineering muss quasi den Motor erstmal starten.
			--player:commandSetSystemPowerRequest(system, 0.0)
		end
		player_carrier_prep()
		player_carrier()
	end

	require("utils.lua")
	require("src/lively_epsilon/init.lua")
	require("resources/products.lua")
	Script():run("reiche/Sonstiges.lua")

	PSHIPNAME = player:getCallSign()
	-- SOL-SYSTEM
	-- Stern und Planeten -- Die Artefakte dienen zur lesbarkeit auf den Radarschirmen.
	sun1 = Planet():setPosition(120000, 0):setPlanetRadius(10000):setDistanceFromMovementPlane(-3000):setPlanetSurfaceTexture("planets/sun-1.png"):setPlanetAtmosphereTexture("planets/star-1.png"):setPlanetAtmosphereColor(1,0.5,0):setAxialRotationTime(1000)
		sun2 = Artifact():setPosition(120000, 0):setModel("SensorBuoyMKI"):setCallSign("Sol"):setDescription("Stern: Sol. Im allgemeinen auch als Sonne bezeichnet."):setScanningParameters(1, 1):setFaction("Unabh�ngige")
		sun2.Gescannt = 0
	merkur1 = Planet():setPosition(111664, -13005):setPlanetRadius(500):setDistanceFromMovementPlane(-50):setPlanetSurfaceTexture("planets/merkur-2.png")
		merkur2 = Artifact():setPosition(111664, -13005):setModel("SensorBuoyMKI"):setCallSign("Merkur"):setDescription("Planet: Merkur."):setScanningParameters(1, 1):setFaction("Unabh�ngige")
		merkur2.Gescannt = 0
		merkur2.TuffDaten = 1
	venus1 = Planet():setPosition(137872, 14535):setPlanetRadius(1000):setDistanceFromMovementPlane(-500):setPlanetSurfaceTexture("planets/venus-2.png"):setPlanetCloudTexture("planets/venus-2.png"):setPlanetAtmosphereTexture("planets/venus-2.png"):setPlanetAtmosphereColor(-1,-1,-1):setAxialRotationTime(2000.0)
		venus2 = Artifact():setPosition(137872, 14535):setModel("SensorBuoyMKI"):setCallSign("Venus"):setDescription("Planet: Venus."):setScanningParameters(1, 1):setFaction("Unabh�ngige")
		venus2.Gescannt = 0
		venus2.TuffDaten = 1
	earth1 = Planet():setPosition(85250, -519):setPlanetRadius(1250):setDistanceFromMovementPlane(-700):setPlanetSurfaceTexture("planets/earth-1.png"):setPlanetCloudTexture("planets/clouds-1.png"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.2,0.2,1.0):setAxialRotationTime(1000.0)
		earth2 = Artifact():setPosition(85250, -519):setModel("SensorBuoyMKI"):setCallSign("Terra"):setDescription("Planet: Erde. Von manchen Religi�sen auch Gaia genannt."):setScanningParameters(1, 1):setFaction("Terranische Navy")
		earth2.Gescannt = 0
		earth2.TuffDaten = 1
	moon1 = Planet():setPosition(83526, 1936):setPlanetRadius(500):setPlanetSurfaceTexture("planets/moon-2.png")
		moon2 = Artifact():setPosition(83526, 1936):setModel("SensorBuoyMKI"):setCallSign("TN C&C"):setDescription("Mond. \n\n Auf dem Trabanten der Erde befindet sich die ausgelagerte Basis der Terranischen Navy. Von hier steuert und �berwacht die Admiralit�t die Terranische Flotte."):setScanningParameters(1, 0):setFaction("Terranische Navy")
		moon2.Gescannt = 0
	mars1 = Planet():setPosition(150735, -30537):setCallSign("Mars Comm-Link-Station"):setPlanetRadius(1100):setDistanceFromMovementPlane(-700):setPlanetSurfaceTexture("planets/mars-1.png"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.1,0.1,0.1):setAxialRotationTime(1000.0)
		mars2 = Artifact():setPosition(150735, -30537):setModel("SensorBuoyMKI"):setCallSign("Mars"):setDescription("Planet: Mars."):setScanningParameters(1, 1):setFaction("Mars Tech Union")
		mars2.Gescannt = 0
		mars2.TuffDaten = 1
	jupiter1 = Planet():setPosition(173499, -6871):setPlanetRadius(3000):setPlanetSurfaceTexture("planets/jupiter-1.png"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.1,0.1,0.1):setAxialRotationTime(25.0)
		jupiter2 = Artifact():setPosition(173499, -6871):setModel("SensorBuoyMKI"):setCallSign("Jupiter"):setDescription("Planet: Jupiter."):setScanningParameters(1, 1):setFaction("Unabh�ngige")
		jupiter2.Gescannt = 0
		jupiter2.TuffDaten = 1
	saturn1 = Planet():setPosition(75271, -45952):setPlanetRadius(2500):setPlanetSurfaceTexture("planets/saturn-1.png"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.1,0.1,0.1):setAxialRotationTime(200.0)
		saturn2 = Artifact():setPosition(75271, -45952):setModel("SensorBuoyMKI"):setCallSign("Saturn"):setDescription("Planet: Saturn."):setScanningParameters(1, 1):setFaction("Unabh�ngige")
		saturn2.Gescannt = 0
		saturn2.TuffDaten = 1
	uranus1 = Planet():setPosition(164408, 68598):setPlanetRadius(2000):setDistanceFromMovementPlane(-1250):setPlanetSurfaceTexture("planets/uranus-1.png"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.1,0.1,0.1):setAxialRotationTime(200.0)
		uranus2 = Artifact():setPosition(164408, 68598):setModel("SensorBuoyMKI"):setCallSign("Uranus"):setDescription("Planet: Uranus."):setScanningParameters(1, 1):setFaction("Unabh�ngige")
		uranus2.Gescannt = 0
		uranus2.TuffDaten = 1
	neptun1 = Planet():setPosition(47779, 72861):setPlanetRadius(2000):setDistanceFromMovementPlane(-1250):setPlanetSurfaceTexture("planets/neptun-1.png"):setPlanetAtmosphereTexture("planets/atmosphere.png"):setPlanetAtmosphereColor(0.1,0.1,0.1):setAxialRotationTime(200.0)
		neptun2 = Artifact():setPosition(47779, 72861):setModel("SensorBuoyMKI"):setCallSign("Neptun"):setDescription("Planet: Neptun."):setScanningParameters(1, 1):setFaction("Unabh�ngige")
		neptun2.Gescannt = 0
		neptun2.TuffDaten = 1
	pluto1 = Planet():setPosition(182630, -112156):setPlanetRadius(400):setPlanetSurfaceTexture("planets/pluto-1.png"):setAxialRotationTime(100.0)
		pluto2 = Artifact():setPosition(182630, -112156):setModel("SensorBuoyMKI"):setCallSign("Pluto"):setDescription("Planet: Pluto."):setScanningParameters(1, 1):setFaction("Unabh�ngige")
		pluto2.Gescannt = 0
		pluto2.TuffDaten = 1
	-- Stern und Planeten Ende
	
	--Asteroiden
	AddAsteroiden()
	--Asteroiden Ende
	
	-- Raumstationen
	earthstation1 = 	SpaceStation():setPosition(82286, 167):setTemplate("Medium Station"):setFaction("Terranische Navy"):setRotation(random(0, 360)):setCallSign("TN Alpharius-01"):setDescription("Alpharius. Werft und Basis aller bisheriger TN Operationen."):setScanningParameters(0, 0)
	earthstation1:setCommsFunction(earthstation1_call)
	player:commandDock(earthstation1)
	marsstation1 = 		SpaceStation():setTemplate("Medium Station"):setFaction("Mars Tech Union"):setCallSign("MTU Ares-01"):setPosition(148108, -29222):setDescription("Ares-01. Werft und Hauptverteidigungslinie der Mars Tech Union.")
	marsstation1:setCommsFunction(mars_comms)
	jupiterstation1 = 	SpaceStation():setTemplate("Small Station"):setFaction("Unabh�ngige"):setCallSign("JS-I"):setPosition(177406, -9858):setDescription("Hauptstadt der Freien. Ger�chteweise ist es ihnen egal wer zum Handeln kommt. Ein jeder wird gleich behandelt."):setScanningParameters(0, 0)
	venusstation1 = 	SpaceStation():setTemplate("Small Station"):setFaction("Unabh�ngige"):setCallSign("HS-I"):setPosition(140114, 15979):setDescription("Freie Handelststation im Venusorbit. Bekannt f�r seine Bordelle und Casinos."):setScanningParameters(0, 0)
	saturnstation1 =    SpaceStation():setTemplate("Small Station"):setFaction("Unabh�ngige"):setCallSign("HS-III"):setPosition(72826, -40565):setDescription("Eine der gr��ten Mine im System. Mehr Mineralabbau gibt es nur im Asteroideng�rtel."):setScanningParameters(0, 0)
	uranusstation1 =    SpaceStation():setTemplate("Small Station"):setFaction("Piraten"):setCallSign("Tortuga-Station"):setPosition(166434, 71341):setDescription("Es gibt hier nur Monster. Wenn du eins bist, willkommen! Setz dich, nimm einen Krug Grogg und habe einen Profitabelen Tag.")
	uranusstation1:setCommsFunction(tortuga_comms)
	neptunstation1 = 	SpaceStation():setTemplate("Small Station"):setFaction("Unabh�ngige"):setCallSign("HS-V"):setPosition(50693, 70482):setDescription(""):setScanningParameters(0, 0)
	asteroidenstation1 =SpaceStation():setTemplate("Small Station"):setFaction("Unabh�ngige"):setCallSign("HS-IV"):setPosition(111996, 49541):setDescription(""):setScanningParameters(0, 0)
	asteroidenstation1:setCommsFunction(brocken_comms)
	-- Raumstation Ende
  
	-- Raumschiffe
	-- Unabh�ngige Transporter
	Transport_1=	CpuShip():setFaction("Unabh�ngige"):setTemplate("Equipment Freighter 4"):setCallSign("UH HT-09"):setPosition(73503, -40404):orderDock(jupiterstation1):setCommsFunction(HT_09_1_call)
		Transport_1:setScanningParameters(0, 0):setDescription("Typ: Handelsschiff \nWirkt wie ein sehr heruntergekommener Frachter der Nebulon-Klasse.")
		Transport_1.Gescannt = 0
	Transport_2=    CpuShip():setFaction("Unabh�ngige"):setTemplate("Equipment Freighter 4"):setCallSign("UH PR-16"):setPosition(83859, 4035):orderDock(marsstation1):setCommsFunction(PR_16_2_call)
		Transport_2:setScanningParameters(0, 0):setDescription("Typ: Handelsschiff \nFrisch lackierter Frachter der Nebulon-Klasse. Wirkt als w�re es frisch aus dem Raumhafen gekommen.")
		Transport_2.Gescannt = 0
	Transport_3=    CpuShip():setFaction("Unabh�ngige"):setTemplate("Fuel Freighter 1"):setCallSign("UH GB-14"):setPosition(181053, -5324):orderDock(venusstation1):setCommsFunction(GB_14_3_call)
		Transport_3:setScanningParameters(0, 0):setDescription("Typ: Handelsschiff \nHochtechnisierter Frachter f�r Treibstoffe. Wirkt gut gewartet.")
		Transport_3.Gescannt = 0
	Transport_4=    CpuShip():setFaction("Unabh�ngige"):setTemplate("Transport3x1"):setCallSign("UH XX-X4"):setPosition(138813,45781):orderRoaming()
		Transport_4:setScanningParameters(1, 4):setDescription("Typ: Handelsschiff \nTransport f�r Nukleares Material. Die Strahlungswerte sind so stark das so zimelich alles in seiner n�he �berdeckt wird.")
		Transport_4.Gescannt = 0
	Transport_5=    CpuShip():setFaction("Unabh�ngige"):setTemplate("Equipment Freighter 5"):setCallSign("UH LA-02"):setPosition(152108, -26265):orderDock(neptunstation1):setCommsFunction(LA_02_5_call)
		Transport_5:setScanningParameters(0, 0):setDescription("Typ: Handelsschiff \nDie verkratzte Oberfl�che des Schiffes deutet auf h�ufige passagen durch den Asteroiden G�rtel.")
		Transport_5.Gescannt = 0
	Transport_6=    CpuShip():setFaction("Unabh�ngige"):setTemplate("Personnel Freighter 5"):setCallSign("UH WC-26"):setPosition(113500, 27754):orderDock(earthstation1):setCommsFunction(WC_26_6_call):setImpulseMaxSpeed(0)
		Transport_6:setScanningParameters(0, 0):setDescription("Typ: Personenf�hre \nDas Schiff ist ein Personaltransporter. Fluktuationen der Deflektorschilde machen das Schiff leicht erkennbar. Zudem scheinen die Triebwerke nicht sauber zu laufen.")
		Transport_6.Gescannt = 0
	Transport_7=    CpuShip():setFaction("Unabh�ngige"):setTemplate("Flavia"):setCallSign("UH JS-08"):setPosition(70087, -38142):orderDock(asteroidenstation1):setCommsFunction(JS_08_7_call):setImpulseMaxSpeed(50):setRotationMaxSpeed(10):setShieldsMax(80.00, 80.00):setShields(80.00, 80.00):setBeamWeapon(0, 45, 0, 1000, 6, 4):setBeamWeaponTurret(0, 0, 0, 0):setBeamWeapon(1, 45, -180, 1000, 6, 4):setBeamWeaponTurret(1, 0, 0, 0)
		Transport_7:setScanningParameters(0, 0):setDescription("Typ: Handelsschiff \nPrivates Handelsschiff. Erh�hte Energiesignatur deutet auf modifizerte Systeme hin.")
		Transport_7.Gescannt = 0
	Transport_8=    CpuShip():setFaction("Unabh�ngige"):setTemplate("Goods Freighter 5"):setCallSign("UH ER-10"):setPosition(114557, -44122):orderDock(asteroidenstation1):setCommsFunction(ER_10_8_call):setImpulseMaxSpeed(10)
		Transport_8:setScanningParameters(0, 0):setDescription("Typ: Handelsschiff \nHandelsschiff eines gro� Unternehmens auf der Erde. �ussere Markierungen weisen auf die >Weyland-Yutani Corporation< hin.")
		Transport_8.Gescannt = 0
	Transport_9=    CpuShip():setFaction("Unabh�ngige"):setTemplate("Garbage Freighter 2"):setCallSign("UH CD-22"):setPosition(52352,60806):orderDock(marsstation1):setCommsFunction(CD_22_9_call)
		Transport_9:setScanningParameters(0, 0):setDescription("Typ: Wertstofffrachter \n�u�erlich keine Besonderheiten zu erkennen.")
		Transport_9.Gescannt = 0
	Transport_10=   CpuShip():setFaction("Unabh�ngige"):setTemplate("Personnel Freighter 2"):setCallSign("UH PK-12"):setPosition(175992, -17068):orderDock(saturnstation1):setCommsFunction(PK_12_10_call)
		Transport_10:setScanningParameters(0, 0):setDescription("Typ: Personenf�hre \nKleiner Personentransporter, er scheint ein paar Treffer an seiner H�lle abbekommen zu haben.")
		Transport_10.Gescannt = 0
	Transport_11=	CpuShip():setFaction("Unabh�ngige"):setTemplate("Transport3x2"):setCallSign("UH SJ-11"):setPosition(172131, -34223):orderFlyTowards(78674, 3085):setCommsFunction(SJ_11_11_call)
		Transport_11:setScanningParameters(0, 0):setDescription("Typ: Erzsch�rfer \nZerbeult und an vielen Stellen verrostet.")
		Transport_11.Gescannt = 0
	Transport_12=	CpuShip():setFaction("Unabh�ngige"):setTemplate("Transport3x3"):setCallSign("UH PU-06"):setPosition(145055, -30750):orderDock(neptunstation1):setCommsFunction(PU_06_12_call)
		Transport_12:setScanningParameters(0, 0):setDescription("Typ: Eissch�rfer \nHohe Masseanzeigen deuten auf einen gut gef�llten Laderaum.")
		Transport_12.Gescannt = 0
	Transport_13=   CpuShip():setFaction("Unabh�ngige"):setTemplate("Transport5x1"):setCallSign("UH LE-05"):setPosition(112552,48942):setCommsFunction(LE_05_13_call):setBeamWeapon(0, 46, 0, 2000, 5, 4)
		Transport_13:setScanningParameters(0, 0):setDescription("Typ: Erzsch�rfer \n�u�erlich ein gew�hnlicher Erzsch�rfer. Keine Besonderheiten zu erkennen.")
		Transport_13.Gescannt = 0
	-- Piraten
    pirat_01=	CpuShip():setFaction("Piraten"):setTemplate("Bomber"):setCallSign("Manta"):setPosition(169496, 78635):orderDefendLocation(169496, 78635):setWarpDrive(true)
    pirat_02=	CpuShip():setFaction("Piraten"):setTemplate("Bomber"):setCallSign("Hai"):setPosition(172687, 77739):orderDefendLocation(172687, 77739):setWarpDrive(true)
	pirat_03=	CpuShip():setFaction("Piraten"):setTemplate("Bomber"):setCallSign("Hecht"):setPosition(174153, 75720):orderDefendLocation(174153, 75720):setWarpDrive(true)
    pirat_04=	CpuShip():setFaction("Piraten"):setTemplate("Bomber"):setCallSign("Wels"):setPosition(170915, 76644):orderDefendLocation(170915, 76644):setWarpDrive(true)
    pirat_05=	CpuShip():setFaction("Piraten"):setTemplate("J�ger"):setCallSign("Barrakuda"):setPosition(166757, 77651):orderDefendLocation(166757, 77651):setWarpDrive(true)
    pirat_06=	CpuShip():setFaction("Piraten"):setTemplate("J�ger"):setCallSign("Barsch"):setPosition(172850, 74108):orderDefendLocation(172850, 74108):setWarpDrive(true)
    pirat_07=	CpuShip():setFaction("Piraten"):setTemplate("J�ger"):setCallSign("Forelle"):setPosition(170203, 75227):orderDefendLocation(170203, 75227):setWarpDrive(true)
    pirat_08=	CpuShip():setFaction("Piraten"):setTemplate("J�ger"):setCallSign("Makrele"):setPosition(166561, 76080):orderDefendLocation(166561, 76080):setWarpDrive(true)
    pirat_09=	CpuShip():setFaction("Piraten"):setTemplate("J�ger"):setCallSign("Thunfisch"):setPosition(168496, 75398):orderDefendLocation(168496, 75398):setWarpDrive(true)
	pirat_10=	CpuShip():setFaction("Piraten"):setTemplate("Korvette"):setCallSign("Tigerhai"):setPosition(169047, 77131):orderDefendLocation(169047, 77131):setWarpDrive(true)
	-- Terranische Navy
    tn_01=	CpuShip():setFaction("Terranische Navy"):setTemplate("Zerst�rer-II"):setCallSign("TN Albatross"):setPosition(77018, -2069):setScanned(true):orderDefendLocation(77018, -2069):setWarpDrive(true)
	tn_01_t = 1
    tn_02=	CpuShip():setFaction("Terranische Navy"):setTemplate("Zerst�rer-I"):setCallSign("TN Falk"):setPosition(80490, -51674):setScanned(true):orderDefendLocation(80490, -51674):setWarpDrive(true)
	tn_02_t = 1
	tn_03=	CpuShip():setFaction("Terranische Navy"):setTemplate("Fregatte"):setCallSign("TN Predator"):setPosition(79495, 5298):setScanned(true):orderDefendLocation(79495, 5298):setWarpDrive(true)
	tn_03_t = 1
    tn_04=	CpuShip():setFaction("Terranische Navy"):setTemplate("Fregatte"):setCallSign("TN Striker"):setPosition(44866, 67654):setScanned(true):orderDefendLocation(44866, 67654):setWarpDrive(true)
	tn_04_t = 1
    tn_05=	CpuShip():setFaction("Terranische Navy"):setTemplate("Korvette"):setCallSign("TN Fidelitas"):setPosition(80945, -6112):setScanned(true):orderDefendLocation(80945, -6112):setWarpDrive(true)
	tn_05_t = 1
	tn_06=	CpuShip():setFaction("Terranische Navy"):setTemplate("Korvette"):setCallSign("TN Prestige"):setPosition(78231, -53005):setScanned(true):orderDefendLocation(78231, -53005):setWarpDrive(true)
	tn_06_t = 1
    tn_07=	CpuShip():setFaction("Terranische Navy"):setTemplate("Korvette"):setCallSign("TN Tesla"):setPosition(47437, 64947):setScanned(true):orderDefendLocation(47437, 64947):setWarpDrive(true)
	tn_07_t = 1
    tn_08=	CpuShip():setFaction("Terranische Navy"):setTemplate("Korvette"):setCallSign("TN Black-Sky"):setPosition(44063, 63704):setScanned(true):orderDefendLocation(44063,63704):setWarpDrive(true)
	tn_08_t = 1
	-- Mars Tech Union
    mtu_01=	CpuShip():setFaction("Mars Tech Union"):setTemplate("Zerst�rer-II"):setCallSign("MTU Karyptis"):setPosition(144810, 14944):orderDefendLocation(144810, 14944):setWarpDrive(true)
    mtu_02=	CpuShip():setFaction("Mars Tech Union"):setTemplate("Zerst�rer-I"):setCallSign("MTU Skylla"):setPosition(147570, -25057):orderDefendLocation(147570, -25057):setWarpDrive(true)
	mtu_03=	CpuShip():setFaction("Mars Tech Union"):setTemplate("Fregatte"):setCallSign("MTU Hurricane"):setPosition(146055, -28685):orderDefendLocation(146055, -28685):setWarpDrive(true)
    mtu_04=	CpuShip():setFaction("Mars Tech Union"):setTemplate("Fregatte"):setCallSign("MTU Calypso"):setPosition(181961, -12625):orderDefendLocation(181961, -12625):setWarpDrive(true)
    mtu_05=	CpuShip():setFaction("Mars Tech Union"):setTemplate("Korvette"):setCallSign("MTU Taco-Bell"):setPosition(146854, -26914):orderDefendLocation(146854, -26914):setWarpDrive(true)
    mtu_06=	CpuShip():setFaction("Mars Tech Union"):setTemplate("Korvette"):setCallSign("MTU Primaris"):setPosition(176810, -12445):orderDefendLocation(176810, -12445):setWarpDrive(true)
    mtu_07=	CpuShip():setFaction("Mars Tech Union"):setTemplate("Korvette"):setCallSign("MTU Mefisto"):setPosition(144896, -27251):orderDefendLocation(144896, -27251):setWarpDrive(true)
    mtu_08=	CpuShip():setFaction("Mars Tech Union"):setTemplate("Korvette"):setCallSign("MTU FuckYou"):setPosition(142860, 10991):orderDefendLocation(142860, 10991):setWarpDrive(true)
	-- Alien --
	alien_01= CpuShip():setFaction("Alien (Friedlich)"):setTemplate("Cruiser"):setCallSign("?*'#&45/"):setPosition(183023, -112526):setHullMax(100):setHull(100):setJumpDrive(true):setBeamWeapon(2, 49, 1, 1300, 5.9, 6.0):setBeamWeaponTurret(2, 67, 1, 1)
		alien_01:setScanningParameters(4, 2):setCommsFunction(aliencomms):setDescriptions("Schiffserkennung nicht eindeutig.\n\n �hnlichster Typ: Cruiser. \n\n\n Unbekanntes Schiff." , "Schiff nicht aus dem Sol-System. Unbekannte Zeichen auf der H�lle.")
		alien_01.Gescannt = 0
	-- Raumschiffe Ende

mission_state = 0
tech_ab_ter = 1
pir = 1
pir2 = 1
pir3 = 1
pircom = 1
pircred = 0
pirchance = 0
terur = 1
zikm = 1
brocken_kauf = 1
RepZ1 = 0 -- Multiplikator f�r Rep. durch Zigarren
RepZ2 = 0 -- Multiplikator f�r Rep. durch Zigaretten
tn_t_Z1 = 0 -- Zigarren Counter
tn_t_Z2 = 0 -- Zigaretten Counter
HT_09_1 = 1 -- Mission offen f�r Transport_1
PR_16_2 = 1 -- Mission offen f�r Transport_2
GB_14_3 = 1 -- Mission offen f�r Transport_3
LA_02_5 = 1 -- Mission offen f�r Transport_5
WC_26_6 = 1 -- Mission offen f�r Transport_6
JS_08_7 = 1 -- Mission offen f�r Transport_7
ER_10_8 = 1 -- Mission offen f�r Transport_8
ER_10_8_A = 1
ER_10_8_hack = 1
CD_22_9 = 1 -- Mission offen f�r Transport_9
PK_12_10 = 1 -- Mission offen f�r Transport_10
SJ_11_11 = nil -- Mission offen f�r Transport_11
PU_06_12 = nil -- Mission offen f�r Transport_12
LE_05_13 = nil -- Mission offen f�r Transport_13
UH_Check = 0

mining()

			--removeGMFunction("Konsortium")
			--removeGMFunction("Allianz")
			--removeGMFunction("Thiras-Imperium")
			--removeGMFunction("Levian-Republik")
			--removeGMFunction("Freie-Systeme")
			--removeGMFunction("Skartis")
			--removeGMFunction("Baras")
	-- GM Befehle --
	kons = 1
	alli = 1
	thir = 1
	lev = 1
	fre = 1
	skar = 1
	bar = 1
	
	addGMFunction("Bergbau", function() --Startet das Bergbau Script. --
		Script():run("scenario_mineral_de.lua")
	end)
	
	addGMFunction("Mars Politik", function() -- �ffnet die Optionen f�r Fraktionsweite Befehle, Mars und Piraten.
		addGMFunction("Krieg", function()
			marsstation1:setFaction("Mars Tech Union (Krieg)")
			mtu_01:setFaction("Mars Tech Union (Krieg)")
			mtu_02:setFaction("Mars Tech Union (Krieg)")
			mtu_03:setFaction("Mars Tech Union (Krieg)")
			mtu_04:setFaction("Mars Tech Union (Krieg)")
			mtu_05:setFaction("Mars Tech Union (Krieg)")
			mtu_06:setFaction("Mars Tech Union (Krieg)")
			mtu_07:setFaction("Mars Tech Union (Krieg)")
			mtu_08:setFaction("Mars Tech Union (Krieg)")
		end)
	
		addGMFunction("Friede", function()
			marsstation1:setFaction("Mars Tech Union")
			mtu_01:setFaction("Mars Tech Union")
			mtu_02:setFaction("Mars Tech Union")
			mtu_03:setFaction("Mars Tech Union")
			mtu_04:setFaction("Mars Tech Union")
			mtu_05:setFaction("Mars Tech Union")
			mtu_06:setFaction("Mars Tech Union")
			mtu_07:setFaction("Mars Tech Union")
			mtu_08:setFaction("Mars Tech Union")
		end)
	
		addGMFunction("Solare Allianz", function()
			marsstation1:setFaction("Terranische Navy")
			mtu_01:setFaction("Terranische Navy")
			mtu_02:setFaction("Terranische Navy")
			mtu_03:setFaction("Terranische Navy")
			mtu_04:setFaction("Terranische Navy")
			mtu_05:setFaction("Terranische Navy")
			mtu_06:setFaction("Terranische Navy")
			mtu_07:setFaction("Terranische Navy")
			mtu_08:setFaction("Terranische Navy")
		end)
	
		addGMFunction("P-Alliierte", function()
			marsstation1:setFaction("Piraten (Alliierte)")
			pirat_01:setFaction("Piraten (Alliierte)")
			pirat_02:setFaction("Piraten (Alliierte)")
			pirat_03:setFaction("Piraten (Alliierte)")
			pirat_04:setFaction("Piraten (Alliierte)")
			pirat_05:setFaction("Piraten (Alliierte)")
			pirat_06:setFaction("Piraten (Alliierte)")
			pirat_07:setFaction("Piraten (Alliierte)")
			pirat_08:setFaction("Piraten (Alliierte)")
			pirat_09:setFaction("Piraten (Alliierte)")
			pirat_10:setFaction("Piraten (Alliierte)")
		end)
	
		addGMFunction("P-ExAlliierte", function()
			marsstation1:setFaction("Piraten")
			pirat_01:setFaction("Piraten")
			pirat_02:setFaction("Piraten")
			pirat_03:setFaction("Piraten")
			pirat_04:setFaction("Piraten")
			pirat_05:setFaction("Piraten")
			pirat_06:setFaction("Piraten")
			pirat_07:setFaction("Piraten")
			pirat_08:setFaction("Piraten")
			pirat_09:setFaction("Piraten")
			pirat_10:setFaction("Piraten")
		end)
	end)
	
	addGMFunction("Galaxis",function()
		if kons == 1 then
			addGMFunction("Konsortium",function()
				Script():run("reiche/Konsortium.lua")
				removeGMFunction("Konsortium")
				removeGMFunction("Allianz")
				removeGMFunction("Thiras-Imperium")
				removeGMFunction("Levian-Republik")
				removeGMFunction("Freie-Systeme")
				removeGMFunction("Skartis")
				removeGMFunction("Baras")
				kons = nil
			end)
		end
		if alli == 1 then
			addGMFunction("Allianz",function()
				Script():run("reiche/Allianz/Cadia-Liga.lua")
				Script():run("reiche/Allianz/Callidus-Gilde.lua")
				Script():run("reiche/Allianz/Volar-Buendnis.lua")
				removeGMFunction("Konsortium")
				removeGMFunction("Allianz")
				removeGMFunction("Thiras-Imperium")
				removeGMFunction("Levian-Republik")
				removeGMFunction("Freie-Systeme")
				removeGMFunction("Skartis")
				removeGMFunction("Baras")
				alli = nil
			end)
		end
		if thir == 1 then
			addGMFunction("Thiras-Imperium",function()
				Script():run("reiche/Thiras-Imperium.lua")
				removeGMFunction("Konsortium")
				removeGMFunction("Allianz")
				removeGMFunction("Thiras-Imperium")
				removeGMFunction("Levian-Republik")
				removeGMFunction("Freie-Systeme")
				removeGMFunction("Skartis")
				removeGMFunction("Baras")
				thir = nil
			end)
		end
		if lev == 1 then
			addGMFunction("Levian-Republik",function()
				Script():run("reiche/Levian-Republik.lua")
				removeGMFunction("Konsortium")
				removeGMFunction("Allianz")
				removeGMFunction("Thiras-Imperium")
				removeGMFunction("Levian-Republik")
				removeGMFunction("Freie-Systeme")
				removeGMFunction("Skartis")
				removeGMFunction("Baras")
				lev = nil
			end)
		end
		if fre == 1 then
			addGMFunction("Freie-Systeme",function()
				Script():run("reiche/Freie-Systeme.lua")
				removeGMFunction("Konsortium")
				removeGMFunction("Allianz")
				removeGMFunction("Thiras-Imperium")
				removeGMFunction("Levian-Republik")
				removeGMFunction("Freie-Systeme")
				removeGMFunction("Skartis")
				removeGMFunction("Baras")
				fre = nil
			end)
		end
		if skar == 1 then
			addGMFunction("Skartis",function()
				Script():run("reiche/Skartis.lua")
				removeGMFunction("Konsortium")
				removeGMFunction("Allianz")
				removeGMFunction("Thiras-Imperium")
				removeGMFunction("Levian-Republik")
				removeGMFunction("Freie-Systeme")
				removeGMFunction("Skartis")
				removeGMFunction("Baras")
				skar = nil
			end)
		end
		if bar == 1 then
			addGMFunction("Baras",function()
				Script():run("reiche/Baras.lua")
				removeGMFunction("Konsortium")
				removeGMFunction("Allianz")
				removeGMFunction("Thiras-Imperium")
				removeGMFunction("Levian-Republik")
				removeGMFunction("Freie-Systeme")
				removeGMFunction("Skartis")
				removeGMFunction("Baras")
				bar = nil
			end)
		end
	end)
	
	addGMFunction("K�hlmittel", function() -- �ffnet die Optionen f�r K�hlmittelaussto�
		addGMFunction("KMA erlauben", coolant_f) -- K�hlmittelaussto� erlauben
		addGMFunction("KMA entziehen", function() -- K�hlmittelaussto� entziehen
			player:removeCustom("Coolant_Override")
		end)		
		addGMFunction("KM Reset", function() -- Reset K�hlmittel
			coolant = 0
			coolant_lvl = nil
		end)		
	end)

	addGMFunction("S�ubern", function() -- l�scht alle Optionen mit au�nahme der Startoptionen.
		removeGMFunction("Krieg")
		removeGMFunction("Friede")
		removeGMFunction("Solare Allianz")
		removeGMFunction("P-Alliierte")
		removeGMFunction("P-ExAlliierte")
		removeGMFunction("Erz +")
		removeGMFunction("Erz + SP")
		removeGMFunction("Erz -")
		removeGMFunction("KMA erlauben")
		removeGMFunction("KM Reset")
		removeGMFunction("KMA entziehen")
		removeGMFunction("Konsortium")
		removeGMFunction("Allianz")
		removeGMFunction("Thiras-Imperium")
		removeGMFunction("Levian-Republik")
		removeGMFunction("Freie-Systeme")
		removeGMFunction("Skartis")
		removeGMFunction("Baras")
		if kons == nil and alli == nil and thir == nil and lev == nil and fre == nil and skar == nil and bar == nil then
			removeGMFunction("Galaxis")
		end
	end)
	-- GM Befehle Ende --
end

function player_carrier_prep()
-- Spieler Tr�ger --
		fighter_01=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 01"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player)
		fighter_02=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 02"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player)
		fighter_03=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 03"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player)
		fighter_04=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 04"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player)
		fighter_05=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 05"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player)
		fighter_06=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 06"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player)
		bomber_01=	CpuShip():setFaction(player:getFaction()):setTemplate("Bomber"):setCallSign("TNB 01"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player)
		bomber_02=	CpuShip():setFaction(player:getFaction()):setTemplate("Bomber"):setCallSign("TNB 02"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player)
		bomber_03=	CpuShip():setFaction(player:getFaction()):setTemplate("Bomber"):setCallSign("TNB 03"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player)
		bomber_04=	CpuShip():setFaction(player:getFaction()):setTemplate("Bomber"):setCallSign("TNB 04"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player)
		fighter_01:destroy()
		fighter_02:destroy()
		fighter_03:destroy()
		fighter_04:destroy()
		fighter_05:destroy()
		fighter_06:destroy()
		bomber_01:destroy()
		bomber_02:destroy()
		bomber_03:destroy()
		bomber_04:destroy()
		playerfighter_01= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJP 01"):setScanned(true)
		playerfighter_02= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJP 02"):setScanned(true)
		playerfighter_03= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJP 03"):setScanned(true)
		playerfighter_04= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJP 04"):setScanned(true)
		playerfighter_05= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJP 05"):setScanned(true)
		playerfighter_06= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJP 06"):setScanned(true)
		playerbomber_01= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("Bomber P"):setPosition(player:getPosition()):setCallSign("TNBP 01"):setScanned(true)
		playerbomber_02= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("Bomber P"):setPosition(player:getPosition()):setCallSign("TNBP 02"):setScanned(true)
		playerbomber_03= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("Bomber P"):setPosition(player:getPosition()):setCallSign("TNBP 03"):setScanned(true)
		playerbomber_04= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("Bomber P"):setPosition(player:getPosition()):setCallSign("TNBP 04"):setScanned(true)
		playerfighter_01:destroy()
		playerfighter_02:destroy()
		playerfighter_03:destroy()
		playerfighter_04:destroy()
		playerfighter_05:destroy()
		playerfighter_06:destroy()
		playerbomber_01:destroy()
		playerbomber_02:destroy()
		playerbomber_03:destroy()
		playerbomber_04:destroy()
		-- Spieler Tr�ger Ende--
end

function player_carrier()
	player.fighter_01carrier = 1
	player.fighter_02carrier = 1
	player.fighter_03carrier = 1
	player.fighter_04carrier = 1
	player.fighter_05carrier = 1
	player.fighter_06carrier = 1
	player.bomber_01carrier = 1
	player.bomber_02carrier = 1
	player.bomber_03carrier = 1
	player.bomber_04carrier = 1
	
	player:addCustomButton("relay","SchiSta","Schiffe Starten", function()
	if player:getAlertLevel() == "RED ALERT" then
	player:addCustomButton("relay","jaggo","J�ger Starten", function()
		if player.fighter_01carrier == 1 then
		fighter_01=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 01"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player):setWarpDrive(false)
		player.fighter_01carrier = 0
		elseif player.fighter_01carrier == 3 then
		playerfighter_01= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJ Black-Jack"):setWarpDrive(false)
		player.fighter_01carrier = 4
		end
		if player.fighter_02carrier == 1 then
		fighter_02=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 02"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player):setWarpDrive(false)
		player.fighter_02carrier = 0
		elseif player.fighter_02carrier == 3 then
		playerfighter_02= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJP 02"):setWarpDrive(false)
		player.fighter_02carrier = 4
		end
		if player.fighter_03carrier == 1 then
		fighter_03=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 03"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player):setWarpDrive(false)
		player.fighter_03carrier = 0
		elseif player.fighter_03carrier == 3 then
		playerfighter_03= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJP 03"):setWarpDrive(false)
		player.fighter_03carrier = 4
		end
		if player.fighter_04carrier == 1 then
		fighter_04=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 04"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player):setWarpDrive(false)
		player.fighter_04carrier = 0
		elseif player.fighter_04carrier == 3 then
		playerfighter_04= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJP 04"):setWarpDrive(false)
		player.fighter_04carrier = 4
		end
		if player.fighter_05carrier == 1 then
		fighter_05=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 05"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player):setWarpDrive(false)
		player.fighter_05carrier = 0
		elseif player.fighter_05carrier == 3 then
		playerfighter_05= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJP 05"):setWarpDrive(false)
		player.fighter_05carrier = 4
		end
		if player.fighter_06carrier == 1 then
		fighter_06=	CpuShip():setFaction(player:getFaction()):setTemplate("J�ger"):setCallSign("TNJ 06"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player):setWarpDrive(false)
		player.fighter_06carrier = 0
		elseif player.fighter_06carrier == 3 then
		playerfighter_06= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("J�ger P"):setPosition(player:getPosition()):setCallSign("TNJP 06"):setWarpDrive(false)
		player.fighter_06carrier = 4
		end
		player:removeCustom("jaggo")
		player:removeCustom("bomgo")
	end)
	
	player:addCustomButton("relay","bomgo","Bomber Starten", function()
		if player.bomber_01carrier == 1 then
		bomber_01=	CpuShip():setFaction(player:getFaction()):setTemplate("Bomber"):setCallSign("TNB 01"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player):setWarpDrive(false)
		player.bomber_01carrier = 0
		elseif player.bomber_01carrier == 3 then
		playerbomber_01= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("Bomber P"):setPosition(player:getPosition()):setCallSign("TNBP 01"):setWarpDrive(false)
		player.bomber_01carrier = 4
		end
		if player.bomber_02carrier == 1 then
		bomber_02=	CpuShip():setFaction(player:getFaction()):setTemplate("Bomber"):setCallSign("TNB 02"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player):setWarpDrive(false)
		player.bomber_02carrier = 0
		elseif player.bomber_02carrier == 3 then
		playerbomber_02= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("Bomber P"):setPosition(player:getPosition()):setCallSign("TNBP 02"):setWarpDrive(false)
		player.bomber_02carrier = 4
		end
		if player.bomber_03carrier == 1 then
		bomber_03=	CpuShip():setFaction(player:getFaction()):setTemplate("Bomber"):setCallSign("TNB 03"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player):setWarpDrive(false)
		player.bomber_03carrier = 0
		elseif player.bomber_03carrier == 3 then
		playerbomber_03= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("Bomber P"):setPosition(player:getPosition()):setCallSign("TNBP 03"):setWarpDrive(false)
		player.bomber_03carrier = 4
		end
		if player.bomber_04carrier == 1 then
		bomber_04=	CpuShip():setFaction(player:getFaction()):setTemplate("Bomber"):setCallSign("TNB 04"):setScanned(true):setPosition(player:getPosition()):orderDefendTarget(player):setWarpDrive(false)
		player.bomber_04carrier = 0
		elseif player.bomber_04carrier == 3 then
		playerbomber_04= PlayerSpaceship():setFaction("Terranische Navy"):setTemplate("Bomber P"):setPosition(player:getPosition()):setCallSign("TNBP 04"):setWarpDrive(false)
		player.bomber_04carrier = 4
		end
		player:removeCustom("jaggo")
		player:removeCustom("bomgo")
	end)
	else
		player:addCustomMessage("relay","alertlvl","Alarmstufe nicht auf Rot! Mannschaften nicht auf Posten.")
	end
	end)
	
	player:addCustomButton("relay","hangartakein","Schiffe Aufnehmen", function()
		if player:getAlertLevel() == "YELLOW ALERT" then
			if fighter_01:isDocked(player) then
				fighter_01:destroy()
				player.fighter_01carrier = 1
			elseif playerfighter_01:isDocked(player) then
				playerfighter_01:destroy()
				player.fighter_01carrier = 3
			end
			if fighter_02:isDocked(player) then
				fighter_02:destroy()
				player.fighter_02carrier = 1
			elseif playerfighter_02:isDocked(player) then
				playerfighter_02:destroy()
				player.fighter_02carrier = 3
			end
			if fighter_03:isDocked(player) then
				fighter_03:destroy()
				player.fighter_03carrier = 1
			elseif playerfighter_03:isDocked(player) then
				playerfighter_03:destroy()
				player.fighter_03carrier = 3
			end
			if fighter_04:isDocked(player) then
				fighter_04:destroy()
				player.fighter_04carrier = 1
			elseif playerfighter_04:isDocked(player) then
				playerfighter_04:destroy()
				player.fighter_04carrier = 3
			end
			if fighter_05:isDocked(player) then
				fighter_05:destroy()
				player.fighter_05carrier = 1
			elseif playerfighter_05:isDocked(player) then
				playerfighter_05:destroy()
				player.fighter_05carrier = 3
			end
			if fighter_06:isDocked(player) then
				fighter_06:destroy()
				player.fighter_06carrier = 1
			elseif playerfighter_06:isDocked(player) then
				playerfighter_06:destroy()
				player.fighter_06carrier = 3
			end
			if bomber_01:isDocked(player) then
				bomber_01:destroy()
				player.bomber_01carrier = 1
			elseif playerbomber_01:isDocked(player) then
				playerbomber_01:destroy()
				player.bomber_01carrier = 3
			end
			if bomber_02:isDocked(player) then
				bomber_02:destroy()
				player.bomber_02carrier = 1
			elseif playerbomber_02:isDocked(player) then
				playerbomber_02:destroy()
				player.bomber_02carrier = 3
			end
			if bomber_03:isDocked(player) then
				bomber_03:destroy()
				player.bomber_03carrier = 1
			elseif playerbomber_03:isDocked(player) then
				playerbomber_03:destroy()
				player.bomber_03carrier = 3
			end
			if bomber_04:isDocked(player) then
				bomber_04:destroy()
				player.bomber_04carrier = 1
			elseif playerbomber_04:isDocked(player) then
				playerbomber_04:destroy()
				player.bomber_04carrier = 3
			end
		else
		player:addCustomMessage("relay","alertlvl2","Alarmstufe nicht auf Gelb! Einmannschiffe k�nnen nur bei gelber Alarmstufe aufgenommen werden.")
		end
	end)
	
	player:addCustomButton("relay","dockingorder","Docking Befehl", function()
		fighter_01:orderDock(player)
		fighter_02:orderDock(player)
		fighter_03:orderDock(player)
		fighter_04:orderDock(player)
		fighter_05:orderDock(player)
		fighter_06:orderDock(player)
		bomber_01:orderDock(player)
		bomber_02:orderDock(player)
		bomber_03:orderDock(player)
		bomber_04:orderDock(player)
	end)
	
	player:addCustomButton("relay","aendern","Besatzung", function()
		player:addCustomButton("relay","offiziere","Offiziere einsetzen", function()
			player:removeCustom("offiziere")
			player:removeCustom("piloten")
			player:addCustomButton("relay","offizierej","O-J�ger einsetzen", function()
				if 	player.fighter_01carrier == 1 then
					player:addCustomButton("relay","playerf1","J�ger 01",function()
						player.fighter_01carrier = 3
						player:removeCustom("playerf1")
						player:removeCustom("playerf2")
						player:removeCustom("playerf3")
						player:removeCustom("playerf4")
						player:removeCustom("playerf5")
						player:removeCustom("playerf6")
					end)
				end
				if 	player.fighter_02carrier == 1 then
					player:addCustomButton("relay","playerf2","J�ger 02",function()
						player.fighter_02carrier = 3
						player:removeCustom("playerf1")
						player:removeCustom("playerf2")
						player:removeCustom("playerf3")
						player:removeCustom("playerf4")
						player:removeCustom("playerf5")
						player:removeCustom("playerf6")
					end)
				end
				if 	player.fighter_03carrier == 1 then
					player:addCustomButton("relay","playerf3","J�ger 03",function()
						player.fighter_03carrier = 3
						player:removeCustom("playerf1")
						player:removeCustom("playerf2")
						player:removeCustom("playerf3")
						player:removeCustom("playerf4")
						player:removeCustom("playerf5")
						player:removeCustom("playerf6")
					end)
				end
				if 	player.fighter_04carrier == 1 then
					player:addCustomButton("relay","playerf4","J�ger 04",function()
						player.fighter_04carrier = 3
						player:removeCustom("playerf1")
						player:removeCustom("playerf2")
						player:removeCustom("playerf3")
						player:removeCustom("playerf4")
						player:removeCustom("playerf5")
						player:removeCustom("playerf6")
					end)
				end
				if 	player.fighter_05carrier == 1 then
					player:addCustomButton("relay","playerf5","J�ger 05",function()
						player.fighter_05carrier = 3
						player:removeCustom("playerf1")
						player:removeCustom("playerf2")
						player:removeCustom("playerf3")
						player:removeCustom("playerf4")
						player:removeCustom("playerf5")
						player:removeCustom("playerf6")
					end)
				end
				if 	player.fighter_06carrier == 1 then
					player:addCustomButton("relay","playerf6","J�ger 06",function()
						player.fighter_06carrier = 3
						player:removeCustom("playerf1")
						player:removeCustom("playerf2")
						player:removeCustom("playerf3")
						player:removeCustom("playerf4")
						player:removeCustom("playerf5")
						player:removeCustom("playerf6")
					end)
				end
				player:addCustomButton("relay","playerremoptj","Opt. L�schen",function()
					player:removeCustom("playerf1")
					player:removeCustom("playerf2")
					player:removeCustom("playerf3")
					player:removeCustom("playerf4")
					player:removeCustom("playerf5")
					player:removeCustom("playerf6")
					player:removeCustom("playerremoptj")
				end)
				player:removeCustom("offizierej")
				player:removeCustom("offiziereb")
			end)
			player:addCustomButton("relay","offiziereb","O-Bomber einsetzen", function()
				if 	player.bomber_01carrier == 1 then
					player:addCustomButton("relay","playerb1","Bomber 01",function()
						player.bomber_01carrier = 3
						player:removeCustom("playerb1")
						player:removeCustom("playerb2")
						player:removeCustom("playerb3")
						player:removeCustom("playerb4")
					end)
				end
				if 	player.bomber_02carrier == 1 then
					player:addCustomButton("relay","playerb2","Bomber 02",function()
						player.bomber_02carrier = 3
						player:removeCustom("playerb1")
						player:removeCustom("playerb2")
						player:removeCustom("playerb3")
						player:removeCustom("playerb4")
					end)
				end
				if 	player.bomber_03carrier == 1 then
					player:addCustomButton("relay","playerb3","Bomber 03",function()
						player.bomber_03carrier = 3
						player:removeCustom("playerb1")
						player:removeCustom("playerb2")
						player:removeCustom("playerb3")
						player:removeCustom("playerb4")
					end)
				end
				if 	player.bomber_04carrier == 1 then
					player:addCustomButton("relay","playerb4","Bomber 04",function()
						player.bomber_04carrier = 3
						player:removeCustom("playerb1")
						player:removeCustom("playerb2")
						player:removeCustom("playerb3")
						player:removeCustom("playerb4")
					end)
				end
				player:addCustomButton("relay","playerremoptb","Opt. L�schen",function()
					player:removeCustom("playerb1")
					player:removeCustom("playerb2")
					player:removeCustom("playerb3")
					player:removeCustom("playerb4")
					player:removeCustom("playerremoptb")
				end)
				player:removeCustom("offiziereb")
				player:removeCustom("offizierej")
			end)
		end)
		player:addCustomButton("relay","piloten","Piloten einsetzen.", function()
			player:removeCustom("piloten")
			player:removeCustom("offiziere")
			player:addCustomButton("relay","pilotenj","P-J�ger einsetzen", function()
				if 	player.fighter_01carrier == 3 then
					player:addCustomButton("relay","kif1","Fighter 01",function()
						player.fighter_01carrier = 1
						player:removeCustom("kif1")
						player:removeCustom("kif2")
						player:removeCustom("kif3")
						player:removeCustom("kif4")
						player:removeCustom("kif5")
						player:removeCustom("kif6")
					end)
				end
				if 	player.fighter_02carrier == 3 then	
					player:addCustomButton("relay","kif2","Fighter 02",function()
						player.fighter_02carrier = 1
						player:removeCustom("kif1")
						player:removeCustom("kif2")
						player:removeCustom("kif3")
						player:removeCustom("kif4")
						player:removeCustom("kif5")
						player:removeCustom("kif6")
					end)
				end
				if 	player.fighter_03carrier == 3 then
					player:addCustomButton("relay","kif3","Fighter 03",function()
						player.fighter_03carrier = 1
						player:removeCustom("kif1")
						player:removeCustom("kif2")
						player:removeCustom("kif3")
						player:removeCustom("kif4")
						player:removeCustom("kif5")
						player:removeCustom("kif6")
					end)
				end
				if 	player.fighter_04carrier == 3 then
					player:addCustomButton("relay","kif4","Fighter 04",function()
						player.fighter_04carrier = 1
						player:removeCustom("kif1")
						player:removeCustom("kif2")
						player:removeCustom("kif3")
						player:removeCustom("kif4")
						player:removeCustom("kif5")
						player:removeCustom("kif6")
					end)
				end
				if 	player.fighter_05carrier == 3 then
					player:addCustomButton("relay","kif5","Fighter 05",function()
						player.fighter_05carrier = 1
						player:removeCustom("kif1")
						player:removeCustom("kif2")
						player:removeCustom("kif3")
						player:removeCustom("kif4")
						player:removeCustom("kif5")
						player:removeCustom("kif6")
					end)
				end
				if 	player.fighter_06carrier == 3 then
					player:addCustomButton("relay","kif6","Fighter 06",function()
						player.fighter_06carrier = 1
						player:removeCustom("kif1")
						player:removeCustom("kif2")
						player:removeCustom("kif3")
						player:removeCustom("kif4")
						player:removeCustom("kif5")
						player:removeCustom("kif6")
					end)
				end
				player:addCustomButton("relay","pilotenremoptj","Opt. L�schen",function()
					player:removeCustom("kif1")
					player:removeCustom("kif2")
					player:removeCustom("kif3")
					player:removeCustom("kif4")
					player:removeCustom("kif5")
					player:removeCustom("kif6")
					player:removeCustom("pilotenremoptj")
				end)
				player:removeCustom("pilotenj")
				player:removeCustom("pilotenb")
			end)
			player:addCustomButton("relay","pilotenb","P-Bomber einsetzen", function()
				if 	player.bomber_01carrier == 3 then
					player:addCustomButton("relay","kib1","Bomber 01",function()
						player.bomber_01carrier = 1
						player:removeCustom("kib1")
						player:removeCustom("kib2")
						player:removeCustom("kib3")
						player:removeCustom("kib4")
					end)
				end
				if 	player.bomber_02carrier == 3 then
					player:addCustomButton("relay","kib2","Bomber 02",function()
						player.bomber_02carrier = 1
						player:removeCustom("kib1")
						player:removeCustom("kib2")
						player:removeCustom("kib3")
						player:removeCustom("kib4")
					end)
				end
				if 	player.bomber_03carrier == 3 then
					player:addCustomButton("relay","kib3","Bomber 03",function()
						player.bomber_03carrier = 1
						player:removeCustom("kib1")
						player:removeCustom("kib2")
						player:removeCustom("kib3")
						player:removeCustom("kib4")
					end)
				end
				if 	player.bomber_04carrier == 3 then
					player:addCustomButton("relay","kib4","Bomber 04",function()
						player.bomber_04carrier = 1
						player:removeCustom("kib1")
						player:removeCustom("kib2")
						player:removeCustom("kib3")
						player:removeCustom("kib4")
					end)
				end
				player:addCustomButton("relay","pilotenremoptb","Opt. L�schen",function()
					player:removeCustom("kib1")
					player:removeCustom("kib2")
					player:removeCustom("kib3")
					player:removeCustom("kib4")
					player:removeCustom("pilotenremoptb")
				end)
				player:removeCustom("pilotenb")
				player:removeCustom("pilotenj")
			end)
		end)
	end)
end

function AddAsteroiden()
-- Saturn Ring
	Asteroid():setPosition(79086, -45983)
    Asteroid():setPosition(79191, -47250)
    Asteroid():setPosition(76024, -42103)
    Asteroid():setPosition(79112, -46590)
    Asteroid():setPosition(79139, -46300)
    Asteroid():setPosition(79033, -47092)
    Asteroid():setPosition(79112, -46854)
    Asteroid():setPosition(79059, -45323)
    Asteroid():setPosition(79007, -45033)
    Asteroid():setPosition(79112, -46168)
    Asteroid():setPosition(78980, -45772)
    Asteroid():setPosition(78795, -44426)
    Asteroid():setPosition(78690, -44109)
    Asteroid():setPosition(79007, -44478)
    Asteroid():setPosition(78822, -44505)
    Asteroid():setPosition(78399, -43660)
    Asteroid():setPosition(78215, -43449)
    Asteroid():setPosition(78690, -43792)
    Asteroid():setPosition(78505, -43818)
    Asteroid():setPosition(77106, -42525)
    Asteroid():setPosition(77317, -42631)
    Asteroid():setPosition(76816, -42367)
    Asteroid():setPosition(77581, -42868)
    Asteroid():setPosition(77396, -42472)
    Asteroid():setPosition(78083, -43290)
    Asteroid():setPosition(77845, -43106)
    Asteroid():setPosition(79323, -46537)
    Asteroid():setPosition(79350, -46775)
    Asteroid():setPosition(79271, -47012)
    Asteroid():setPosition(79376, -46300)
    Asteroid():setPosition(79297, -45983)
    Asteroid():setPosition(79271, -45798)
    Asteroid():setPosition(79244, -45561)
    Asteroid():setPosition(79033, -47593)
    Asteroid():setPosition(78901, -47751)
    Asteroid():setPosition(79139, -47725)
    Asteroid():setPosition(78716, -47699)
    Asteroid():setPosition(78927, -47356)
    Asteroid():setPosition(79244, -45376)
    Asteroid():setPosition(76948, -42182)
    Asteroid():setPosition(76393, -42129)
    Asteroid():setPosition(76472, -41971)
    Asteroid():setPosition(76103, -41918)
    Asteroid():setPosition(78215, -43185)
    Asteroid():setPosition(78030, -42921)
    Asteroid():setPosition(77713, -42763)
    Asteroid():setPosition(77528, -42551)
    Asteroid():setPosition(77159, -42287)
    Asteroid():setPosition(79165, -45033)
    Asteroid():setPosition(79059, -44769)
    Asteroid():setPosition(78901, -44109)
    Asteroid():setPosition(78795, -43898)
    Asteroid():setPosition(78452, -43475)
    Asteroid():setPosition(75232, -41865)
    Asteroid():setPosition(75522, -41865)
    Asteroid():setPosition(75153, -42235)
    Asteroid():setPosition(75839, -41891)
    Asteroid():setPosition(75654, -42050)
    Asteroid():setPosition(74783, -42208)
    Asteroid():setPosition(76736, -41997)
    Asteroid():setPosition(75337, -42050)
    Asteroid():setPosition(74994, -41971)
    Asteroid():setPosition(78373, -48411)
    Asteroid():setPosition(78452, -48623)
    Asteroid():setPosition(78663, -48279)
    Asteroid():setPosition(78611, -48015)
    Asteroid():setPosition(78822, -48042)
    Asteroid():setPosition(78109, -48939)
    Asteroid():setPosition(78030, -49203)
    Asteroid():setPosition(77845, -49230)
    Asteroid():setPosition(77924, -49309)
    Asteroid():setPosition(78215, -48966)
    Asteroid():setPosition(78320, -48675)
    Asteroid():setPosition(78479, -48306)
    Asteroid():setPosition(78690, -48306)
    Asteroid():setPosition(73437, -42261)
    Asteroid():setPosition(73991, -42050)
    Asteroid():setPosition(74414, -42050)
    Asteroid():setPosition(74598, -41997)
    Asteroid():setPosition(74519, -42182)
    Asteroid():setPosition(71668, -45165)
    Asteroid():setPosition(71457, -44531)
    Asteroid():setPosition(72143, -48702)
    Asteroid():setPosition(72223, -48860)
    Asteroid():setPosition(71959, -44294)
    Asteroid():setPosition(71800, -48121)
    Asteroid():setPosition(71880, -48332)
    Asteroid():setPosition(71378, -48200)
    Asteroid():setPosition(71536, -47699)
    Asteroid():setPosition(71510, -47303)
    Asteroid():setPosition(71589, -48015)
    Asteroid():setPosition(71404, -45851)
    Asteroid():setPosition(71404, -46115)
    Asteroid():setPosition(71404, -46379)
    Asteroid():setPosition(71378, -47065)
    Asteroid():setPosition(72355, -49203)
    Asteroid():setPosition(72434, -49098)
    Asteroid():setPosition(71880, -48649)
    Asteroid():setPosition(72143, -49098)
    Asteroid():setPosition(73833, -42155)
    Asteroid():setPosition(73701, -42393)
    Asteroid():setPosition(74229, -42050)
    Asteroid():setPosition(74123, -42314)
    Asteroid():setPosition(76974, -49837)
    Asteroid():setPosition(75865, -50074)
    Asteroid():setPosition(76341, -50022)
    Asteroid():setPosition(72962, -49652)
    Asteroid():setPosition(75073, -50154)
    Asteroid():setPosition(74493, -50206)
    Asteroid():setPosition(76077, -50312)
    Asteroid():setPosition(75813, -50259)
    Asteroid():setPosition(75258, -50259)
    Asteroid():setPosition(73516, -49784)
    Asteroid():setPosition(73094, -49678)
    Asteroid():setPosition(73358, -49863)
    Asteroid():setPosition(73516, -49942)
    Asteroid():setPosition(73067, -49467)
    Asteroid():setPosition(72909, -49546)
    Asteroid():setPosition(72645, -49441)
    Asteroid():setPosition(73358, -49573)
    Asteroid():setPosition(73938, -50180)
    Asteroid():setPosition(74150, -50022)
    Asteroid():setPosition(74282, -50259)
    Asteroid():setPosition(72751, -49230)
    Asteroid():setPosition(72724, -49467)
    Asteroid():setPosition(73727, -49942)
    Asteroid():setPosition(73938, -50101)
    Asteroid():setPosition(77476, -49573)
    Asteroid():setPosition(77766, -49599)
    Asteroid():setPosition(77317, -49916)
    Asteroid():setPosition(77238, -49652)
    Asteroid():setPosition(76446, -49969)
    Asteroid():setPosition(76446, -50312)
    Asteroid():setPosition(77713, -49467)
    Asteroid():setPosition(77872, -49467)
    Asteroid():setPosition(76657, -49890)
    Asteroid():setPosition(77159, -49942)
    Asteroid():setPosition(73595, -42314)
    Asteroid():setPosition(73358, -42446)
    Asteroid():setPosition(72751, -42763)
    Asteroid():setPosition(73015, -42789)
    Asteroid():setPosition(72381, -43475)
    Asteroid():setPosition(72012, -43634)
    Asteroid():setPosition(72143, -43713)
    Asteroid():setPosition(73173, -42631)
    Asteroid():setPosition(72856, -42974)
    Asteroid():setPosition(72170, -43422)
    Asteroid():setPosition(72566, -43396)
    Asteroid():setPosition(72487, -43027)
    Asteroid():setPosition(72988, -42472)
    Asteroid():setPosition(72803, -43185)
    Asteroid():setPosition(72407, -43211)
    Asteroid():setPosition(71695, -48438)
    Asteroid():setPosition(71721, -48306)
    Asteroid():setPosition(71404, -47725)
    Asteroid():setPosition(71880, -48623)
    Asteroid():setPosition(71668, -44769)
    Asteroid():setPosition(71642, -44610)
    Asteroid():setPosition(71774, -44030)
    Asteroid():setPosition(71932, -43924)
    Asteroid():setPosition(71404, -44874)
    Asteroid():setPosition(71431, -45059)
    Asteroid():setPosition(71431, -45429)
    Asteroid():setPosition(71932, -43818)
    Asteroid():setPosition(71536, -44294)
    Asteroid():setPosition(71721, -44294)
    Asteroid():setPosition(74862, -50418)
    Asteroid():setPosition(75918, -50365)
    Asteroid():setPosition(74810, -50180)
    Asteroid():setPosition(75522, -50154)
    Asteroid():setPosition(76156, -50127)
    Asteroid():setPosition(75522, -50338)
    Asteroid():setPosition(75021, -50391)
    Asteroid():setPosition(74598, -50391)
    Asteroid():setPosition(76604, -50074)
    Asteroid():setPosition(76816, -50022)
    Asteroid():setPosition(77502, -49678)
    Asteroid():setPosition(71272, -45745)
    Asteroid():setPosition(71299, -45349)
    Asteroid():setPosition(71220, -46089)
    Asteroid():setPosition(71325, -47514)
    Asteroid():setPosition(71272, -47092)
    Asteroid():setPosition(71246, -46590)
    Asteroid():setPosition(71114, -46801)
    Asteroid():setPosition(71378, -46854)
    Asteroid():setPosition(71193, -46326)
	-- Saturn Ring Ende
	
	-- Innerer Asteroideng�rtel
	Asteroid():setPosition(92697, -42137)
    Asteroid():setPosition(92836, -40885)
    Asteroid():setPosition(94784, -42415)
    Asteroid():setPosition(89776, -40051)
    Asteroid():setPosition(90889, -41163)
    Asteroid():setPosition(102991, -47562)
    Asteroid():setPosition(96314, -44363)
    Asteroid():setPosition(98539, -46032)
    Asteroid():setPosition(101600, -46171)
    Asteroid():setPosition(99791, -44502)
    Asteroid():setPosition(102852, -45476)
    Asteroid():setPosition(92975, 42299)
    Asteroid():setPosition(94366, 43551)
    Asteroid():setPosition(90193, 39796)
    Asteroid():setPosition(81151, 30476)
    Asteroid():setPosition(86159, 37431)
    Asteroid():setPosition(85742, 35622)
    Asteroid():setPosition(72109, -5970)
    Asteroid():setPosition(80317, 26581)
    Asteroid():setPosition(71553, -9726)
    Asteroid():setPosition(71831, -13482)
    Asteroid():setPosition(74335, -13343)
    Asteroid():setPosition(73222, -12091)
    Asteroid():setPosition(75170, -16681)
    Asteroid():setPosition(74474, -20159)
    Asteroid():setPosition(76700, -20715)
    Asteroid():setPosition(85046, -34347)
    Asteroid():setPosition(87689, -36990)
    Asteroid():setPosition(77952, -23080)
    Asteroid():setPosition(76004, -24610)
    Asteroid():setPosition(78091, -27949)
    Asteroid():setPosition(81986, -31704)
    Asteroid():setPosition(122187, -48536)
    Asteroid():setPosition(128030, -47562)
    Asteroid():setPosition(128864, -47980)
    Asteroid():setPosition(129977, -47980)
    Asteroid():setPosition(131090, -46171)
    Asteroid():setPosition(131646, -47840)
    Asteroid():setPosition(108138, -48119)
    Asteroid():setPosition(108555, -49371)
    Asteroid():setPosition(105077, -48119)
    Asteroid():setPosition(104938, -46449)
    Asteroid():setPosition(106747, -47701)
    Asteroid():setPosition(93392, -43946)
    Asteroid():setPosition(92001, -40746)
    Asteroid():setPosition(89776, -38660)
    Asteroid():setPosition(144971, -41096)
    Asteroid():setPosition(146252, -39772)
    Asteroid():setPosition(147504, -40190)
    Asteroid():setPosition(142321, -41584)
    Asteroid():setPosition(142496, -43806)
    Asteroid():setPosition(152790, -36017)
    Asteroid():setPosition(148794, -36959)
    Asteroid():setPosition(150147, -38520)
    Asteroid():setPosition(141105, -42555)
    Asteroid():setPosition(140688, -44224)
    Asteroid():setPosition(137628, -44641)
    Asteroid():setPosition(139575, -46171)
    Asteroid():setPosition(133594, -47840)
    Asteroid():setPosition(135263, -47562)
    Asteroid():setPosition(85324, -35877)
    Asteroid():setPosition(85185, -37825)
    Asteroid():setPosition(86994, -34069)
    Asteroid():setPosition(82403, -33234)
    Asteroid():setPosition(88524, -39216)
    Asteroid():setPosition(89219, -38660)
    Asteroid():setPosition(157937, 37987)
    Asteroid():setPosition(157937, 36874)
    Asteroid():setPosition(161693, 32423)
    Asteroid():setPosition(159189, 34788)
    Asteroid():setPosition(160024, 35761)
    Asteroid():setPosition(158772, 37292)
    Asteroid():setPosition(160163, 34927)
    Asteroid():setPosition(160997, 33814)
    Asteroid():setPosition(156685, 39100)
    Asteroid():setPosition(156546, 39656)
    Asteroid():setPosition(155155, 41047)
    Asteroid():setPosition(154599, 39517)
    Asteroid():setPosition(149313, 44525)
    Asteroid():setPosition(150843, 42856)
    Asteroid():setPosition(146113, 45499)
    Asteroid():setPosition(152095, 42995)
    Asteroid():setPosition(152095, 42021)
    Asteroid():setPosition(142775, 46751)
    Asteroid():setPosition(137071, 48976)
    Asteroid():setPosition(165691, -8707)
    Asteroid():setPosition(166631, -6826)
    Asteroid():setPosition(166005, 13227)
    Asteroid():setPosition(167259, 12404)
    Asteroid():setPosition(166631, -10589)
    Asteroid():setPosition(162765, -19263)
    Asteroid():setPosition(164959, -18323)
    Asteroid():setPosition(163705, -15919)
    Asteroid():setPosition(165795, -14456)
    Asteroid():setPosition(164959, -12365)
    Asteroid():setPosition(162667, 28528)
    Asteroid():setPosition(163084, 30058)
    Asteroid():setPosition(163501, 31310)
    Asteroid():setPosition(162110, 30615)
    Asteroid():setPosition(164475, 26859)
    Asteroid():setPosition(164228, 25572)
    Asteroid():setPosition(164058, 28111)
    Asteroid():setPosition(164959, 23900)
    Asteroid():setPosition(165171, 18652)
    Asteroid():setPosition(166422, 17817)
    Asteroid():setPosition(165586, 20765)
    Asteroid():setPosition(167050, 15539)
    Asteroid():setPosition(153486, 42439)
    Asteroid():setPosition(150565, 43690)
    Asteroid():setPosition(145974, 46890)
    Asteroid():setPosition(141384, 48003)
    Asteroid():setPosition(134568, 50089)
    Asteroid():setPosition(124274, 51341)
    Asteroid():setPosition(125804, 50785)
    Asteroid():setPosition(147922, 44525)
    Asteroid():setPosition(146948, 46055)
    Asteroid():setPosition(136237, 50089)
    Asteroid():setPosition(136515, 50367)
    Asteroid():setPosition(139575, 48976)
    Asteroid():setPosition(129142, 50785)
    Asteroid():setPosition(132759, 50507)
    Asteroid():setPosition(130812, 51202)
    Asteroid():setPosition(122187, 51202)
    Asteroid():setPosition(118014, 52037)
    Asteroid():setPosition(143470, 47724)
    Asteroid():setPosition(143748, 47864)
    Asteroid():setPosition(143053, 48420)
    Asteroid():setPosition(137628, 48698)
    Asteroid():setPosition(126499, 51480)
    Asteroid():setPosition(113563, 50785)
    Asteroid():setPosition(112589, 50646)
    Asteroid():setPosition(114119, 49116)
    Asteroid():setPosition(111615, 48281)
    Asteroid():setPosition(115927, 50228)
    Asteroid():setPosition(108416, 48142)
    Asteroid():setPosition(100765, 46194)
    Asteroid():setPosition(104938, 47307)
    Asteroid():setPosition(94644, 42160)
    Asteroid():setPosition(96314, 44108)
    Asteroid():setPosition(98818, 45777)
    Asteroid():setPosition(97566, 43273)
    Asteroid():setPosition(101878, 46751)
    Asteroid():setPosition(101600, 45360)
    Asteroid():setPosition(132342, 50089)
    Asteroid():setPosition(125943, 50507)
    Asteroid():setPosition(122048, 50228)
    Asteroid():setPosition(117040, 50924)
    Asteroid():setPosition(119822, 50367)
    Asteroid():setPosition(118431, 50924)
    Asteroid():setPosition(110502, 50507)
    Asteroid():setPosition(110224, 49672)
    Asteroid():setPosition(104243, 48142)
    Asteroid():setPosition(106607, 48142)
    Asteroid():setPosition(83099, 34370)
    Asteroid():setPosition(84212, 34927)
    Asteroid():setPosition(85046, 33258)
    Asteroid():setPosition(82821, 31588)
    Asteroid():setPosition(80317, 32145)
    Asteroid():setPosition(88524, 37987)
    Asteroid():setPosition(90054, 37848)
    Asteroid():setPosition(91723, 39378)
    Asteroid():setPosition(92141, 40769)
    Asteroid():setPosition(93392, 40074)
    Asteroid():setPosition(87689, 36179)
    Asteroid():setPosition(79621, 28250)
    Asteroid():setPosition(81429, 29084)
    Asteroid():setPosition(80595, 28528)
    Asteroid():setPosition(78369, 25329)
    Asteroid():setPosition(78091, 22686)
    Asteroid():setPosition(76978, 23103)
    Asteroid():setPosition(76700, 19486)
    Asteroid():setPosition(77395, 20321)
    Asteroid():setPosition(74752, 18791)
    Asteroid():setPosition(75448, 16287)
    Asteroid():setPosition(75448, 16009)
    Asteroid():setPosition(152234, -35321)
    Asteroid():setPosition(147365, -38381)
    Asteroid():setPosition(144166, -39912)
    Asteroid():setPosition(133733, -46449)
    Asteroid():setPosition(135541, -45893)
    Asteroid():setPosition(115649, -50623)
    Asteroid():setPosition(115232, -48953)
    Asteroid():setPosition(110920, -49649)
    Asteroid():setPosition(111337, -48119)
    Asteroid():setPosition(113563, -49788)
    Asteroid():setPosition(120657, -48814)
    Asteroid():setPosition(126360, -46728)
    Asteroid():setPosition(126082, -48258)
    Asteroid():setPosition(124413, -48814)
    Asteroid():setPosition(119266, -49649)
    Asteroid():setPosition(118431, -50344)
    Asteroid():setPosition(121631, -49927)
    Asteroid():setPosition(168787, 8914)
    Asteroid():setPosition(167535, 8636)
    Asteroid():setPosition(167572, 10105)
    Asteroid():setPosition(168370, 5854)
    Asteroid():setPosition(167990, 3834)
    Asteroid():setPosition(169622, 2237)
    Asteroid():setPosition(168095, 1221)
    Asteroid():setPosition(168092, -1240)
    Asteroid():setPosition(168095, -2750)
    Asteroid():setPosition(167781, -6826)
    Asteroid():setPosition(166701, 4880)
    Asteroid():setPosition(166701, -1379)
    Asteroid():setPosition(167118, -4857)
    Asteroid():setPosition(166736, -13620)
    Asteroid():setPosition(161615, -24802)
    Asteroid():setPosition(160047, -26892)
    Asteroid():setPosition(159943, -26474)
    Asteroid():setPosition(155155, -31287)
    Asteroid():setPosition(157121, -32014)
    Asteroid():setPosition(158375, -29505)
    Asteroid():setPosition(159734, -28878)
    Asteroid():setPosition(152627, -33895)
    Asteroid():setPosition(154299, -34417)
    Asteroid():setPosition(155553, -32745)
    Asteroid():setPosition(157121, -29819)
    Asteroid():setPosition(150955, -35671)
    Asteroid():setPosition(161824, -23339)
    Asteroid():setPosition(160988, -22817)
    Asteroid():setPosition(165482, -17800)
    Asteroid():setPosition(163914, -21771)
    Asteroid():setPosition(162660, -21667)
    Asteroid():setPosition(70997, -11534)
    Asteroid():setPosition(72805, -11117)
    Asteroid():setPosition(71692, -11534)
    Asteroid():setPosition(71692, 429)
    Asteroid():setPosition(70162, 429)
    Asteroid():setPosition(71692, 4046)
    Asteroid():setPosition(70440, 7106)
    Asteroid():setPosition(71831, 6828)
    Asteroid():setPosition(72944, 7662)
    Asteroid():setPosition(72527, 9053)
    Asteroid():setPosition(72666, -7639)
    Asteroid():setPosition(72527, -2771)
    Asteroid():setPosition(69327, -5274)
    Asteroid():setPosition(78230, -25306)
    Asteroid():setPosition(76004, -22384)
    Asteroid():setPosition(77256, -19046)
    Asteroid():setPosition(86715, -35599)
    Asteroid():setPosition(82960, -31704)
    Asteroid():setPosition(80317, -28644)
    Asteroid():setPosition(72527, -16959)
    Asteroid():setPosition(73083, -14455)
    Asteroid():setPosition(74057, -14873)
    Asteroid():setPosition(75309, -19046)
    Asteroid():setPosition(73918, -16542)
    Asteroid():setPosition(74057, 15591)
    Asteroid():setPosition(73918, 12253)
    Asteroid():setPosition(72388, 12392)
    Asteroid():setPosition(167814, 16009)
    Asteroid():setPosition(166701, 15174)
    Asteroid():setPosition(70718, -6944)
    Asteroid():setPosition(70718, -4301)
    Asteroid():setPosition(70718, -1936)
    Asteroid():setPosition(70858, 3211)
    Asteroid():setPosition(70301, 12)
	-- Innerer Asteroideng�rtel Ende
end

function earthstation1_call() -- Script f�r Reaktion der TN Alpharius-01 --
	if mission_state == 0 then -- Start des Spiels --
		setCommsMessage([[TN Alpharius-01 an ]].. PSHIPNAME ..[[.
		
Testnachricht.]])
		addCommsReply("Nachricht erhalten.", function() -- Transport_6 wird gestoppt und als Notfall Deklariert --
			mission_state = 9
			Transport_6:setSystemHealth("impulse", -100):setSystemHealth("maneuver", -100)
			setCommsMessage([[Sehr gut, die Comms funktioniert demnach. Wir haben bereits den ersten Auftrag f�r Sie ]].. PSHIPNAME ..[[.
				
Die UH WC-26 meldet einen Notfall. Fahren sie Ihren Reaktor hoch und aktivieren Sie alle Systeme. Docken sie anschlie�end ab und machen sie sich auf den Weg.]])
			addCommsReply("Auftrag erhalten.", function() -- TN Verdandi akzeptiert den Auftrag und Transport_06 wird ansprechbar mit Notfall-Reaktion --
				comm_stat = 1
				setCommsMessage(PSHIPNAME ..[[, melden sie sich wenn die Mission erledigt ist.

Wir w�nschen ihnen einen guten Jungfernflug!]])
			end)
		end)
	end
	
	if mission_state == 2 then -- Notfall der Transport_06 Erledigt -- Aufkl�rung der Gesamt Situation im Sol-System -- Start der eigentlich Mission --
		setCommsMessage([[Haben sie den Auftrag erledigt?]])
		addCommsReply("Auftrag erledigt.", function() -- Erkl�rung der Gesamt Situation --
			setCommsMessage([[Sehr gut, kommen wir nun zu ihrer eigentlichen Mission.
			
Sie wissen wir stehen im kalten Krieges mit der "Mars Tech Union". Der kleinste Zwischenfall k�nnte den kalten Krieg zum hei�en Krieg werden lassen.
Es ist nicht unser Plan einen Krieg zu entfesseln der zur beiderseitigen Ausl�schung f�hren k�nnte.

Die Schiffe der MTU werden sie nicht aktiv angreifen wenn sie in ihre n�he kommen. Ein Angriff ihrerseits w�rde jedoch den Kriegszustand ausl�sen, daher erneut die eindringliche Warnung, verursachen sie keinen Zwischenfall!


Um ihnen ein Aktuelles Bild der Situation zu geben:
Die Piraten sind derzeit relativ ruhig, wir vermuten das sie nur auf eine gelegenheit warten wieder auf karperfahrt zu gehen. Aber in diesem politischen Klima k�nnen wir es nicht wagen unsere Kampfverb�nde zur Piraten jagt zu benutzen.
Eventuell k�nnen sie mit ihnen in Verhandlungen treten, sollten sie auf unsere Seite wechseln w�re dies ein deutlicher Vorteil und ein starkes Druckmittel gegen�ber der MTU. Sie w�ren gezwungen sich unseren forderungen zu beugen.
Zuvor m�ssten sie allerdings die Aufmerksamkeit des Piraten Admirals erregen.


Die Unabh�ngigen H�ndler sind eine enorme Institution f�r beide Parteien, wer sie kontrolliert oder ihnen vorsteht k�nnte frei entscheiden wie dieser Konflikt bew�ltigt wird, da alle von den H�ndlern in gewissem ma�e abh�ngig sind.

Unsere letzten informationen nach haben sie schwer unter den Piraten angriffen zu leiden, besonders da wir keine Eskorten mehr zur verf�gung stellen. Vielleicht k�nnten sie auch mit ihnen in Verhandlungen treten und der Terranischen Navy einen vorteil verschaffen?


Der letzte Scan des Sol-Systems zeigte keine echten Neuerungen.
Die Signale vom Pluto sind laut unseren Wissenschaftlern nat�rlichen Ursprungs, irgendein, mit radiokativem Material durchsetzter, Brocken wird wohl auf den Planeten eingeschlagen sein. Kein Grund f�r weitere Nachforschungen.


Unser Geheimdienst hat ein paar Informationen f�r Sie:
Laut unbekannten Quellen ist ein Wissenschaftler, namens Peter Dex, der MTU auf der Flucht.
Dieser soll ein neuartiges System entwickelt haben Schiffssysteme zu k�hlen. N�heres ist jedoch leider nicht bekannt, ihn zu finden k�nnte uns ebenfalls einen deutlichen Vorteil bescheren.


Zu guter letzt, noch Informationen zur Reputation. Jede Aktion die sie durchf�hren kann Reputation erbringen aber auch kosten. Sehen sie Reputation als eine Mischung aus W�hrung und Einfluss.]])
			mission_state = 3
			addCommsReply("Worin bestehen die gegenseitigen Forderungen der TN und MTU?", function()
				setCommsMessage([[Eine Einigung im Mars-Kontrakt kann erzielt werden wenn mindestens 3 der forderungen beider Seiten erf�llt wurden.
				
Die "Terranische Navy" fordert:
-	Die Piraten los werden.
-	Die eingliederung der MTU unter der Terranischen herrschaft.
-	Zugriff auf die marsianische Industriekapazit�t.
-	Milit�rische �bermacht gegen�ber dem Mars besitzen.
-	Erh�hte priorit�t bei der Belieferung durch H�ndler.
-	Einnehmen der Neptun-Station f�r die TN.

Die "Mars Tech Union" fordert:
-	Die Piraten los werden.
-	Unabh�ngigkeit von der Terranischen herrschaft.
-	Technologieabkommen mit Terra.
-	Alle (3 von 4) untergetauchten Wissenschaftler zur�ckf�hren.
-	Erh�hte priorit�t bei der Belieferung durch H�ndler.
-	Abkaufen der Asteroiden-Station HS-IV, f�r die MTU.]])
			escommq = 1
			if escommq == 1 then
			addCommsReply("Haben sie genauere Informationen �ber die Piraten?", function()
				setCommsMessage([[Wir Wissen lediglich das sie die Neptun-Station (Sektor I13) k�rzlich eingenommen haben und �ber mehr als 5 Schiffe verf�gen.
Sie verstehen sicherlich, dass unsere Priorit�ten derzeit woanders liegen.

Zudem Wissen wir auch nur dass, was alle wissen. Piraten respektieren nur andere Piraten.]])
			end)
			end
			if escommq == 1 then
			addCommsReply("Wer ist der Ansprechpartner der Unabh�ngigen H�ndler?",function()
				setCommsMessage([[Prinzipiell kann man jeden der UH ansprechen. Jeder Kapit�n kocht sein eigenes s�ppchen. Sie sind eine gute Quelle um an Reputations Punkte zu kommen.]])
			end)
			end
			if escommq == 1 then
			addCommsReply("Gibt es mehr informationen �ber die Wissenschaftler?", function()
				setCommsMessage([[Die letzten Informationen deuten darauf hin das er sich auf der Jupiterstation befand. Er ist angeblich einer der vier untergetauchten Wissenschaftler, welche die MTU wieder unter ihrer kontrollen wissen m�chte.

Die anderen Befinden sich ebenfall auf verschiedenen Schiffen der Unabh�ngigen H�ndler. Welche genau wissen wir nicht, wir senden ihnen jedoch alle relevanten Daten um sie auf einem Schiff welches gescannt wird ausfindig zu machen.]])
			end)
			end
			if tech_ab_ter == 1 and escommq == 1 then
				addCommsReply("Was hat es mit dem Technologieabkommen zu tun?", function()
					setCommsMessage([[Es verpflichtet die Terranische Navy, jeden technologischen Fortschritt zuerst an die Mars Tech Union weiter zu leiten.
	
	Im gegenzug verpflichtet sich die MTU Endprodukte der Forschung mit Terra zu teilen. Da wir ausgereifte Technologien erhalten ist es kein zwingend schlechter Deal, dennoch zwingt er uns Funde und Erfindungen erstmal an die MTU abzutreten.
	
	Aber das wir ihnen dieses Abkommen zugestehen m�sste man das Komitee schon �berzeugen.]])
					addCommsReply("2500 Rep.", function()
						if player:getReputationPoints() > 2500 then
						forderungen_count_mars = forderungen_count_mars + 1
						tech_ab_ter = nil
						setCommsMessage("MTU wurde das Technologieabkommen zugesprochen.")
						else
						setCommsMessage("Sie haben nicht genug Rep. Punkte.")
						end
					end)
				end)
			end
			end)
		end)
	end
	
	if mission_state == 3 then -- Standart Begr��ung der TN Alpharius-01 --
		setCommsMessage([[K�nnen wir ihnen weiterhelfen?]])
			addCommsReply("Standart Comms-Optionen erhalten.",function()
				earthstation1:setCommsScript("comms_station.lua")
				player:addCustomButton("relay","back_to_Mission","TN-Alpharius Optionen",function()
					earthstation1:setCommsFunction(earthstation1_call)
					player:removeCustom("back_to_Mission")
					end)
				setCommsMessage("Wechseln auf Automatische System Antwort.")
			end)
			addCommsReply("Worin bestehen die gegenseitigen Forderungen der TN und MTU?", function()
				setCommsMessage([[Eine Einigung im Mars-Kontrakt kann erzielt werden wenn mindestens 3 der forderungen beider Seiten erf�llt wurden.

Die "Terranische Navy" fordert:
-	Die Piraten los werden.
-	Die eingliederung der MTU unter der Terranischen herrschaft.
-	Zugriff auf die marsianische Industriekapazit�t.
-	Milit�rische �bermacht gegen�ber dem Mars besitzen.
-	Erh�hte priorit�t bei der Belieferung durch H�ndler.
-	Einnehmen der Neptun-Station f�r die TN.

Die "Mars Tech Union" fordert:
-	Die Piraten los werden.
-	Unabh�ngigkeit von der Terranischen herrschaft.
-	Technologieabkommen mit Terra.
-	Alle (3 von 4) untergetauchten Wissenschaftler zur�ckf�hren.
-	Erh�hte priorit�t bei der Belieferung durch H�ndler.
-	Abkaufen der Asteroiden-Station HS-IV, f�r die MTU.]])
			escommq = 1
			if escommq == 1 then
			addCommsReply("Haben sie genauere Informationen �ber die Piraten?", function()
				setCommsMessage([[Wir Wissen lediglich das sie die Neptun-Station (Sektor I13) k�rzlich eingenommen haben und �ber mehr als 5 Schiffe verf�gen.
Sie verstehen sicherlich, dass unsere Priorit�ten derzeit woanders liegen.

Zudem Wissen wir auch nur dass, was alle wissen. Piraten respektieren nur andere Piraten.]])
			end)
			end
			if escommq == 1 then
			addCommsReply("Wer ist der Ansprechpartner der Unabh�ngigen H�ndler?",function()
				setCommsMessage([[Prinzipiell kann man jeden der UH ansprechen. Jeder Kapit�n koch sein eigenes s�ppchen. Sie sind eine gute Quelle um an Reputations Punkte zu kommen.]])
			end)
			end
			if escommq == 1 then
			addCommsReply("Gibt es mehr informationen �ber die Wissenschaftler?", function()
				setCommsMessage([[Die letzten Informationen deuten darauf hin das er sich auf der Jupiterstation befand. Er ist angeblich einer der vier untergetauchten Wissenschaftler, welche die MTU wieder unter ihrer kontrollen wissen m�chte.

Die anderen Befinden sich ebenfall auf verschiedenen Schiffen der Unabh�ngigen H�ndler. Welche genau wissen wir nicht, wir senden ihnen jedoch alle relevanten Daten um sie auf einem Schiff welches gescannt wird ausfindig zu machen.]])
			end)
			end
			if tech_ab_ter == 1 and escommq == 1 then
				addCommsReply("Was hat es mit dem Technologieabkommen zu tun?", function()
					setCommsMessage([[Es verpflichtet die Terranische Navy, jeden technologischen Fortschritt zuerst an die Mars Tech Union weiter zu leiten.
	
	Im gegenzug verpflichtet sich die MTU Endprodukte der Forschung mit Terra zu teilen. Da wir ausgereifte Technologien erhalten ist es kein zwingend schlechter Deal, dennoch zwingt er uns Funde und Erfindungen erstmal an die MTU abzutreten.
	
	Aber das wir ihnen dieses Abkommen zugestehen m�sste man das Komitee schon �berzeugen.]])
					addCommsReply("2500 Rep.", function()
						if player:getReputationPoints() > 2500 then
						forderungen_count_mars = forderungen_count_mars + 1
						tech_ab_ter = nil
						setCommsMessage("MTU wurde das Technologieabkommen zugesprochen.")
						else
						setCommsMessage("Sie haben nicht genug Rep. Punkte.")
						end
					end)
				end)
			end
			end)
	end
	
	if mission_state == 4 then -- Wenn drei Wissenschaftler gefunden wurden --
		setCommsMessage("Wir haben geh�rt sie haben 3 untergetauchte Wissenschaftler an Bord.")
			addCommsReply("Das ist richtig.", function()
				setCommsMessage("Bringen sie die Wissenschaftler zur Mars Basis um deren bescheuerte Forderung zu erf�llen...")
				mission_state = 3
				player:addCustomButton("weapons","wiss_ausl", "Gefangene ausliefern", function()
					if distance(player,marsstation1) < 3000 then
						player:removeCustom("oor_wiss_ausl")
						player:removeCustom("wiss_ausl")
						wissens_count = nil
						marsstation1:openCommsTo(player)
						mc = 1
					else
						player:addCustomInfo("weapons","oor_wiss_ausl","Station nicht in Reichweite")
					end
				end)
			end)
			addCommsReply("Ehm,... wir melden uns sp�ter nochmal!",function()
				setCommsMessage("Verstanden, erwarten ihre R�ckmeldung.")
				mission_state = 4
			end)			
	end

	if mission_state == 5 then -- Vorbereitung zum Finale --
		setCommsMessage([[Es wurden genug Forderungen beider Seiten erf�llt um endlich einen Kontrakt anzufertigen, mit dem der kalte Krieg in einen dauerhaften Frieden umgewandelt werden kann.

Die TN Albatross hat das oberste Gremium der Terranischen Navy an Bord.
Fliegen sie zur TN Albatross und eskortieren sie das Schiff zum Merkur. Dort werden alle Kampfverb�nde, sowohl die Terranischen auch die Marsianischen den Verhandlungen und der Unterzeichnung beiwohnen.]])
		addCommsReply("Auftrag die TN Albatross zu eskortieren empfangen.", function()
		escort_tna = 1
		mars_kontrakt()
		end)
	end
	
	if mission_state == 6 then
	mission_state = 3
	end
end

function mars_kontrakt(delta) -- Finale --
	if escort_tna == 1 then
		tn_01:orderFlyTowards(83000,-5000)
		tn_02:orderFlyTowards(110000,-15000)
		tn_03:orderFlyTowards(110000,-15500)
		tn_04:orderFlyTowards(110000,-16000)
		tn_05:orderFlyTowards(110000,-16500)
		tn_06:orderFlyTowards(110000,-17000)
		tn_07:orderFlyTowards(110000,-17500)
		tn_08:orderFlyTowards(110000,-18000)
		
		mtu_01:orderFlyTowards(147000,-30000)
		mtu_02:orderFlyTowards(113000,-15000)
		mtu_03:orderFlyTowards(113000,-15500)
		mtu_04:orderFlyTowards(113000,-16000)
		mtu_05:orderFlyTowards(113000,-16500)
		mtu_06:orderFlyTowards(113000,-17000)
		mtu_07:orderFlyTowards(113000,-17500)
		mtu_08:orderFlyTowards(113000,-18000)
	end
end

function mars_comms() -- Script f�r Reaktion der Marsstation --
	if mc == nil then -- Standart Reaktion Mars-Station
		setCommsMessage("Was wollen sie Terraner?")
		addCommsReply("Standart Comms-Optionen erhalten.",function()
			marsstation1:setCommsScript("comms_station.lua")
			player:addCustomButton("relay","back_to_Mission","TN-Alpharius Optionen",function()
				marsstation1:setCommsFunction(mars_comms)
				player:removeCustom("back_to_Mission")
				end)
			setCommsMessage("Wechseln auf Automatische System Antwort.")
		end)
		if zikm == 1 then
		addCommsReply("Wir wollten uns �ber einen Zugriff auf ihre industriellen Kapazit�ten unterhalten.", function()
			setCommsMessage([[--- schweigen --- *gel�chter im Hintergrund* --- Kanal wird unterbrochen* ---]])
			mc = 4
		end)
		end
	end
	
	if mc == 1 then -- �bergabe der Wissenschaftler und Erf�llung der betreffenden Mars Forderung --
		setCommsMessage("Unsere Forderung wurde erf�llt, wir werden das bei den weiteren Verhandlungen mit Terra ber�cksichtigen.")
		forderung_count_mars = forderung_count_mars + 1
		mc = nil
	end
	
	if mc == 4 then -- Anfrage -- Zugriff auf marsianische industrielle Kapazit�t f�r Terra
		setCommsMessage("Sie schon wieder Terraner?")
		addCommsReply("Z�ndung des Atomarensprengkopfs in 5... 4...", function()
			setCommsMessage([[Was wie? Moment, das war vorhin nicht so gemeint!
			
Sie wollten �ber einen Zugriff auf die industriellen Kapazit�ten auf dem Mars reden?
Ich denke wir k�nnten da etwas aushalnden die Unabh�ngigen H�ndlern haben schlie�lich ebenfalls Zugriff.
Sie wollen schlie�lich deswegen keinen Krieg entfesseln.

Wie klingen 5000 Rep.?]])
			addCommsReply("3... 2...", function() -- Bluffen --
				setCommsMessage("In Ordnung! 2500 Rep.!")
				addCommsReply("In Ordnung wir melden uns wenn wir die Rep. haben.", function()
					mc = 5
					serCommsMessage("--- Verbindung Beendet ---")
				end)
				addCommsReply("Deal.", function()
					if player:getReputationPoints() >= 2500 then
						player:takeReputationPoints(2500)
						mc = nil
						zikm = nil
						forderungen_count_terra = forderungen_count_terra + 1
						setCommsMessage("Zugriff auf marsianische industrielle Kapazit�t f�r Terra gew�hrt.")
					else
						setCommsMessage("Erst gut bluffen und dann nichts in der Hose haben,... kommen sie wieder wenn sie genug Rep.-Punkte haben.")
						mc = 5
					end				
				end)
			end)
			addCommsReply("In Ordnung 5000 Rep.", function() -- Sicheren (teuren) Weg w�hlen --
				if player:getReputationPoints() >= 5000 then
					player:takeReputationPoints(5000)
					mc = nil
					zikm = nil
					forderungen_count_terra = forderungen_count_terra + 1
					setCommsMessage("Zugriff auf marsianische industrielle Kapazit�t f�r Terra gew�hrt.")
				else
					setCommsMessage("Kommen sie wieder wenn sie genug Rep.-Punkte haben.")
					mc = 6
				end
			end)
		end)
	end
	
	if mc == 5 then -- Deal f�r 2500 Rep gew�hlt -- Zugriff auf marsianische industrielle Kapazit�t f�r Terra
		setCommsMessage("Haben sie nun genug Rep.-Punkte dabei?")
		addCommsReply("Ja.", function()
			if player:getReputationPoints() >= 2500 then
				player:takeReputationPoints(2500)
				mc = nil
				zikm = nil
				forderungen_count_terra = forderungen_count_terra + 1
				setCommsMessage("Zugriff auf marsianische industrielle Kapazit�t f�r Terra gew�hrt.")
			else
				setCommsMessage("Sie haben immernoch nicht genug dabei,... kommen sie wieder wenn sie genug Rep.-Punkte haben.")
			end
		end)
	end
	
	if mc == 6 then -- Deal f�r 5000 Rep gew�hlt -- Zugriff auf marsianische industrielle Kapazit�t f�r Terra
		setCommsMessage("Haben sie nun genug Rep.-Punkte dabei?")
		addCommsReply("Ja.", function()
			if player:getReputationPoints() >= 5000 then
				player:takeReputationPoints(5000)
				mc = nil
				zikm = nil
				forderungen_count_terra = forderungen_count_terra + 1
				setCommsMessage("Zugriff auf marsianische industrielle Kapazit�t f�r Terra gew�hrt.")
			else
				setCommsMessage("Sie haben immernoch nicht genug dabei,... kommen sie wieder wenn sie genug Rep.-Punkte haben.")
			end
		end)
	end
end

function HT_09_1_call() -- Script f�r Transport 1 -- Planeten-Forsch-Mission
	if HT_09_1 == nil then
		Transport_1:setCommsScript("comms_ship.lua")
	end

	if HT_09_1 == 1 then
		setCommsMessage([[Seid gegr��t, mein Name ist Haviland Tuff. Was kann ich f�r euch tun.]])
		addCommsReply("Eben das wollten wir sie fragen. Wie kann die ".. PSHIPNAME .." ihnen ihr leben f�r ein paar Rep. erleichtern?", function()
			setCommsMessage([[Oho, h�rt du das Gomorra? Man bietet uns Hilfe, wollen wir sie annehmen?

In der tat. Sie k�nnten eine kleinigkeit f�r mich erledigen.

Tun sie mir doch den gefallen und Scannen sie jeden Planeten im Sonnensystem. �bermitteln sie die Daten und f�r jeden gescannten Planeten erhalten sie... was meinst du Gomorra,... klingen 200 Rep. pro Planet fair?

Ich denke schon. Zuz�glich 200 Rep. wenn sie alle 9 Daten Pakete versand haben. Was meinen Sie ]].. PSHIPNAME ..[[?]])
			addCommsReply("Wir nehmen die Aufgabe an.", function()
				HT_09_1 = 3
				setCommsMessage("In der tat.")
				player:addCustomButton("science","ht_scan_send","Tuff Daten senden.",function()
					if merkur2.TuffDaten == 2 then
						player:addReputationPoints(200)
						merkur2.TuffDaten = 3
					end
					if venus.TuffDaten == 2 then
						player:addReputationPoints(200)
						venus2.TuffDaten = 3
					end
					if eart2.TuffDaten == 2 then
						player:addReputationPoints(200)
						earth2.TuffDaten = 3
					end
					if mars2.TuffDaten == 2 then
						player:addReputationPoints(200)
						mars2.TuffDaten = 3
					end
					if jupiter2.TuffDaten == 2 then
						player:addReputationPoints(200)
						jupiter2.TuffDaten = 3
					end
					if saturn2.TuffDaten == 2 then
						player:addReputationPoints(200)
						saturn2.TuffDaten = 3
					end
					if uranus2.TuffDaten == 2 then
						player:addReputationPoints(200)
						uranus2.TuffDaten = 3
					end
					if neptun2.TuffDaten == 2 then
						player:addReputationPoints(200)
						neptun2.TuffDaten = 3
					end
					if pluto2.TuffDaten == 2 then
						player:addReputationPoints(200)
						pluto2.TuffDaten = 3
					end
					if merkur2.TuffDaten == 3 and venus2.TuffDaten == 3 and earth2.TuffDaten == 3 and mars2.TuffDaten == 3 and jupiter2.TuffDaten == 3 and saturn2.TuffDaten == 3 and uranus2.TuffDaten == 3 and neptun2.TuffDaten == 3 and pluto2.TuffDaten == 3 then
						player:addReputationPoints(200)
						merkur2.TuffDaten = nil
						venus2.TuffDaten = nil
						earth2.TuffDaten = nil
						mars2.TuffDaten = nil
						jupiter2.TuffDaten = nil
						satrun2.TuffDaten = nil
						uranus2.TuffDaten = nil
						neptun2.TuffDaten = nil
						pluto2.TuffDaten = nil
						player:removeCustom("ht_scan_send")
						UH_Check = UH_Check + 1
						HT_09_1 = nil
					end
				end)
			end)
			addCommsReply("Wir �berlegen es uns.",function()
				HT_09_1 = 2
				setCommsMessage("Wir haben Verstanden und erwarten ihr zustimmen.")
			end)
		end)
	end
	
	if HT_09_1 == 2 then
		setCommsMessage([[Sieh nur Sodom, die ]].. PSHIPNAME ..[[ meldet sich.

Welches Schicksal sie wohl f�r uns bereit h�lt?]])
		addCommsReply("Wir nehmen die Aufgabe an.", function()
			HT_09_1 = 3
			setCommsMessage("In der tat.")
			player:addCustomButton("science","ht_scan_send","Tuff Daten senden.",function()
				if merkur2.TuffDaten == 2 then
					player:addReputationPoints(200)
					merkur2.TuffDaten = 3
				end
				if venus.TuffDaten == 2 then
					player:addReputationPoints(200)
					venus2.TuffDaten = 3
				end
				if eart2.TuffDaten == 2 then
					player:addReputationPoints(200)
					earth2.TuffDaten = 3
				end
				if mars2.TuffDaten == 2 then
					player:addReputationPoints(200)
					mars2.TuffDaten = 3
				end
				if jupiter2.TuffDaten == 2 then
					player:addReputationPoints(200)
					jupiter2.TuffDaten = 3
				end
				if saturn2.TuffDaten == 2 then
					player:addReputationPoints(200)
					saturn2.TuffDaten = 3
				end
				if uranus2.TuffDaten == 2 then
					player:addReputationPoints(200)
					uranus2.TuffDaten = 3
				end
				if neptun2.TuffDaten == 2 then
					player:addReputationPoints(200)
					neptun2.TuffDaten = 3
				end
				if pluto2.TuffDaten == 2 then
					player:addReputationPoints(200)
					pluto2.TuffDaten = 3
				end
				if merkur2.TuffDaten == 3 and venus2.TuffDaten == 3 and earth2.TuffDaten == 3 and mars2.TuffDaten == 3 and jupiter2.TuffDaten == 3 and saturn2.TuffDaten == 3 and uranus2.TuffDaten == 3 and neptun2.TuffDaten == 3 and pluto2.TuffDaten == 3 then
					player:addReputationPoints(200)
					merkur2.TuffDaten = nil
					venus2.TuffDaten = nil
					earth2.TuffDaten = nil
					mars2.TuffDaten = nil
					jupiter2.TuffDaten = nil
					satrun2.TuffDaten = nil
					uranus2.TuffDaten = nil
					neptun2.TuffDaten = nil
					pluto2.TuffDaten = nil
					player:removeCustom("ht_scan_send")
					UH_Check = UH_Check + 1
					HT_09_1 = nil
				end
			end)
		end)
		addCommsReply("Wir �berlegen es uns noch mit ihrem Auftrag.",function()
			setCommsMessage("Wir haben Verstanden und erwarten ihre Zustimmung.")
		end)
	end

	if HT_09_1 == 3 then
		setCommsMessage("Sodom und Gomorra sind meine Felinen begleiter. Wussten sie das alle Katzenartigen gewisse Psionischef�higkeiten besitzen? Ich warte �brigens noch auf ein paar Daten. W�ren sie so freundlich?")
	end
end

function PR_16_2_call() -- Script f�r Transport 2 -- Waren-besorgen-Mission
	if PR_16_2 == nil then
		Transport_2:setCommsScript("comms_ship.lua")
	end

	if PR_16_2 == 1 then
		setCommsMessage([[Hier spricht Perry Rhodan von der Stardust.

K�nnten sie uns eingen gefallen tun?]])
		addCommsReply("F�r den richtigen Preis, bestimmt.",function()
			setCommsMessage([[Um unseren Handelsauftrag zu erf�llen br�uchten wir noch ein paar Kisten von der Asteroidenstation.
K�nnten sie uns die eventuell bringen? Es w�ren 500 Rep. daf�r f�r sie drin.]])
			addCommsReply("Wir nehmen den Auftrag an!", function()
				PR_16_2 = 2
				setCommsMessage("Sehr gut! Gehen sie auf 1U an die Station ran dann sollte ihr Ingenieur die Waren r�ber beamen k�nnen. Danach bringen Sie die Waren auf 1U an uns heran und beamens sie zu uns.")
				player:addCustomButton("engineering", "eng_pr_waren", "Stardust Waren Beamen",function()
					if distance(player,asteroidenstation1) <= 1000 then
						player:removeCustom("eng_pr_w_false")
						player:removeCustom("eng_pr_waren")
						player:addCustomButton("engineering","eng_pr_waren_geben","Waren an Stardust beamen.",function()
							if distance(player,Transport_2) <= 1000 then
								player:removeCustom("eng_pr_waren_geben")
								player:addCustomInfo("engineering","pr_waren_weg","Versand best�tigen.")
								player:addCustomButton("engineering","eng_pr_waren_best","Best�tigt",function()
									player:removeCustom("pr_waren_weg")
									player:removeCustom("eng_pr_waren_best")
									PR_16_2 = nil
									player:addReputationPoints(500)
									UH_Check = UH_Check + 1
								end)
							end
						end)
					else
						player:addCustomInfo("engineering","eng_pr_w_false","Ziel au�er Reichweite")
					end
				end)
			end)
			addCommsReply("Wir kommen sp�ter darauf zur�ck.", function()
				setCommsMessage("Verstanden.")
				PR_16_2 = 3
			end)
		end)
	end
	
	if PR_16_2 == 2 then
		setCommsMessage("Wir warten noch auf die Waren, ich werde nicht j�nger! Perry Rhodan, Ende.")
	end
	
	if PR_16_2 == 3 then
		setCostumMessage("Sind sie nun bereit den Auftrag f�r 500 Rep. zu �bernehmen.")
		addCommsReply("Wir nehmen den Auftrag an!", function()
			PR_16_2 = 2
			setCommsMessage("Sehr gut! Gehen sie auf 1U an die Station ran dann sollte ihr Ingenieur die Waren r�ber beamen k�nnen. Danach bringen Sie die Waren auf 1U an uns heran und beamens sie zu uns.")
			player:addCustomButton("engineering", "eng_pr_waren", "Stardust Waren Beamen",function()
				if distance(player,asteroidenstation1) <= 1000 then
					player:removeCustom("eng_pr_w_false")
					player:removeCustom("eng_pr_waren")
					player:addCustomButton("engineering","eng_pr_waren_geben","Waren an Stardust beamen.",function()
						if distance(player,Transport_2) <= 1000 then
							player:removeCustom("eng_pr_waren_geben")
							player:addCustomInfo("engineering","pr_waren_weg","Versand best�tigen.")
							player:addCustomButton("engineering","eng_pr_waren_best","Best�tigt",function()
								player:removeCustom("pr_waren_weg")
								player:removeCustom("eng_pr_waren_best")
								PR_16_2 = nil
								player:addReputationPoints(500)
								UH_Check = UH_Check + 1
							end)
						end
					end)
				else
					player:addCustomInfo("engineering","eng_pr_w_false","Ziel au�er Reichweite")
				end
			end)
		end)
		addCommsReply("Wir kommen sp�ter darauf zur�ck.", function()
			setCommsMessage("Verstanden.")
		end)
	end
end

function GB_14_3_call() -- Script f�r Transport 3 -- Tabakdiebstahl
	if GB_14_3 == nil then
		Transport_3:setCommsScript("comms_ship.lua")
	end

	if GB_14_3 == 1 then
		setCommsMessage([[Erfreut sie kennen zu lernen. Gaius Baltar mein Name. H�tten sie etwas Zeit mir eine Kleinigkeit zu besorgen?]])
		addCommsReply("Um was geht es?",function()
			setCommsMessage([[Ich w�rde gern meiner Nikotin sucht fr�hnen, aber die Marsianer bauen keinen Tabak an. Auch war auf der letzten Station jeder Glimmst�ngel bereits Verkauft.

K�nnten sie mir etwas zu Tabak besorgen? F�r eine Kiste Zigaretten w�rde ich ihnen 200 Rep. geben. Sollten sie Zigarren finden gebe ich ihnen 1000 Rep. f�r eine Kiste!
Leider haben nur Terranische Kampfschiffe Tabakvorr�te. Sie k�nnten doch da bestimmt was drehen oder?]])
			addCommsReply("Ich denke, wir k�nnen da was machen.",function()
				GB_14_3 = 2
				setCommsMessage("Das ist h�chst erfreulich! Am besten ihr Waffenoffizier visiert das Ziel an und ihr Wissenschaftsoffizier beamt sich einfach eine Kiste aus dem Lagerr�umen, das f�llt nicht weiter auf,...")
				player:addCustomButton("engineering", "tabak_liefern", "Tabak abliefern",function()
					if distance(player,Transport_3) <= 3000 then
						player:removeCustom("tabak_dist_tf")
						RepZ1 = tn_t_Z1 * 1000
						player:addReputationPoints(RepZ1)
						tn_t_Z1 = tn_t_Z1 - tn_t_Z1
						RepZ1 = 0
						if tn_01_t == nil and tn_02_t == nil then
							tn_t_Z1 = nil
							RepZ1 = nil
						end
						if tn_t_Z1 == 0 or tn_t_Z1 == nil then
						player:removeCustom("tab_nt")
						player:removeCustom("tab_kt")
						player:removeCustom("tn_t_Z1_1")
						end
						RepZ2 = tn_t_Z2 * 200
						player:addReputationPoints(RepZ2)
						tn_t_Z2 = tn_t_Z2 - tn_t_Z2
						if tn_03_t == nil and tn_04_t == nil and tn_05_t == nil and tn_06_t == nil and tn_07_t == nil and tn_08_t == nil then
							tn_t_Z2 = nil
							RepZ2 = nil
						end
						if tn_t_Z2 == 0 or tn_t_Z2 == nil then
						player:removeCustom("tab_nt")
						player:removeCustom("tab_kt")
						player:removeCustom("tn_t_Z2_1")
						end
						if tn_t_Z1 == nil and tn_t_Z2 == nil then
							player:removeCustom("tabak_liefern")
							GB_14_3 = nil
							UH_Check = UH_Check + 1
						end
					else
						player:addCustomInfo("engineering","tabak_dist_tf","Schiff au�er Reichweite")
					end
				end)
				player:addCustomButton("science","tabak_suche","Nach Tabak scannen.",function()
					tabaktar = player:getTarget()
					if tn_01_t == 1 and tabaktar == tn_01 then
						player:removeCustom("tab_nt")
						player:removeCustom("tab_kt")
						tn_01_t = nil
						tn_t_Z1 = tn_t_Z1 + 1
						player:addCustomInfo("engineering","tn_t_Z1_1","Zigarren Kisten an Bord")
					elseif tn_02_t == 1 and tabaktar == tn_02 then
						player:removeCustom("tab_nt")
						player:removeCustom("tab_kt")
						tn_02_t = nil
						tn_t_Z1 = tn_t_Z1 + 1
						player:addCustomInfo("engineering","tn_t_Z1_1","Zigarren Kisten an Bord")
					elseif tn_03_t == 1 and tabaktar == tn_03 then
						player:removeCustom("tab_nt")
						player:removeCustom("tab_kt")
						tn_03_t = nil
						tn_t_Z2 = tn_t_Z2 + 1
						player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
					elseif tn_04_t == 1 and tabaktar == tn_04 then
						player:removeCustom("tab_nt")
						player:removeCustom("tab_kt")
						tn_04_t = nil
						tn_t_Z2 = tn_t_Z2 + 1
						player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
					elseif tn_05_t == 1 and tabaktar == tn_05 then
						player:removeCustom("tab_nt")
						player:removeCustom("tab_kt")
						tn_05_t = nil
						tn_t_Z2 = tn_t_Z2 + 1
						player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
					elseif tn_06_t == 1 and tabaktar == tn_06 then
						player:removeCustom("tab_nt")
						player:removeCustom("tab_kt")
						tn_06_t = nil
						tn_t_Z2 = tn_t_Z2 + 1
						player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
					elseif tn_07_t == 1 and tabaktar == tn_07 then
						player:removeCustom("tab_nt")
						player:removeCustom("tab_kt")
						tn_07_t = nil
						tn_t_Z2 = tn_t_Z2 + 1
						player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
					elseif tn_08_t == 1 and tabaktar == tn_08 then
						player:removeCustom("tab_nt")
						player:removeCustom("tab_kt")
						tn_08_t = nil
						tn_t_Z2 = tn_t_Z2 + 1
						player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
					elseif tn_01_t == nil and tn_02_t == nil and tn_03_t == nil and tn_04_t == nil and tn_05_t == nil and tn_06_t == nil and tn_07_t == nil and tn_08_t == nil then
						player:removeCustom("tabak_suche")
						player:removeCustom("tab_nt")
						player:removeCustom("tab_kt")
					elseif tabaktar == nil then
						player:removeCustom("tab_kt")
						player:addCustomButton("science","tab_nt","Kein Ziel")
					else
						player:removeCustom("tab_nt")
						player:addCustomButton("science","tab_kt","Kein Tabak")
					end
				end)
			end)
			addCommsReply("Wir kommen darauf zur�ck.",function()
				GB_14_3 = 3
				setCommsMessage("Verstanden.")
			end)
		end)
	end
	
	if GB_14_3 == 2 then
		setCommsMessage("Also ein paar Kisten w�rde ich noch kaufen!")
	end

	if GB_14_3 == 3 then
		setCommsMessage("Haben sie es sich mit dem Tabak nochmal �berlegt?")
		addCommsReply("Ich denke, wir k�nnen da was machen.",function()
			GB_14_3 = 2
			setCommsMessage("Das ist h�chst erfreulich! Am besten ihr Waffenoffizier visiert das Ziel an und ihr Wissenschaftsoffizier beamt sich einfach eine Kiste aus dem Lagerr�umen, das f�llt nicht weiter auf,...")
			player:addCustomButton("engineering", "tabak_liefern", "Tabak abliefern",function()
				if distance(player,Transport_3) <= 3000 then
					player:removeCustom("tabak_dist_tf")
					RepZ1 = tn_t_Z1 * 1000
					player:addReputationPoints(RepZ1)
					tn_t_Z1 = tn_t_Z1 - tn_t_Z1
					RepZ1 = 0
					if tn_01_t == nil and tn_02_t == nil then
						tn_t_Z1 = nil
						RepZ1 = nil
					end
					if tn_t_Z1 == 0 or tn_t_Z1 == nil then
					player:removeCustom("tab_nt")
					player:removeCustom("tab_kt")
					player:removeCustom("tn_t_Z1_1")
					end
					RepZ2 = tn_t_Z2 * 200
					player:addReputationPoints(RepZ2)
					tn_t_Z2 = tn_t_Z2 - tn_t_Z2
					if tn_03_t == nil and tn_04_t == nil and tn_05_t == nil and tn_06_t == nil and tn_07_t == nil and tn_08_t == nil then
						tn_t_Z2 = nil
						RepZ2 = nil
					end
					if tn_t_Z2 == 0 or tn_t_Z2 == nil then
					player:removeCustom("tab_nt")
					player:removeCustom("tab_kt")
					player:removeCustom("tn_t_Z2_1")
					end
					if tn_t_Z1 == nil and tn_t_Z2 == nil then
						player:removeCustom("tabak_liefern")
						GB_14_3 = nil
						UH_Check = UH_Check + 1
					end
				else
					player:addCustomInfo("engineering","tabak_dist_tf","Schiff au�er Reichweite")
				end
			end)
			player:addCustomButton("science","tabak_suche","Nach Tabak scannen.",function()
				tabaktar = player:getTarget()
				if tn_01_t == 1 and tabaktar == tn_01 then
					player:removeCustom("tab_nt")
					player:removeCustom("tab_kt")
					tn_01_t = nil
					tn_t_Z1 = tn_t_Z1 + 1
					player:addCustomInfo("engineering","tn_t_Z1_1","Zigarren Kisten an Bord")
				elseif tn_02_t == 1 and tabaktar == tn_02 then
					player:removeCustom("tab_nt")
					player:removeCustom("tab_kt")
					tn_02_t = nil
					tn_t_Z1 = tn_t_Z1 + 1
					player:addCustomInfo("engineering","tn_t_Z1_1","Zigarren Kisten an Bord")
				elseif tn_03_t == 1 and tabaktar == tn_03 then
					player:removeCustom("tab_nt")
					player:removeCustom("tab_kt")
					tn_03_t = nil
					tn_t_Z2 = tn_t_Z2 + 1
					player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
				elseif tn_04_t == 1 and tabaktar == tn_04 then
					player:removeCustom("tab_nt")
					player:removeCustom("tab_kt")
					tn_04_t = nil
					tn_t_Z2 = tn_t_Z2 + 1
					player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
				elseif tn_05_t == 1 and tabaktar == tn_05 then
					player:removeCustom("tab_nt")
					player:removeCustom("tab_kt")
					tn_05_t = nil
					tn_t_Z2 = tn_t_Z2 + 1
					player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
				elseif tn_06_t == 1 and tabaktar == tn_06 then
					player:removeCustom("tab_nt")
					player:removeCustom("tab_kt")
					tn_06_t = nil
					tn_t_Z2 = tn_t_Z2 + 1
					player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
				elseif tn_07_t == 1 and tabaktar == tn_07 then
					player:removeCustom("tab_nt")
					player:removeCustom("tab_kt")
					tn_07_t = nil
					tn_t_Z2 = tn_t_Z2 + 1
					player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
				elseif tn_08_t == 1 and tabaktar == tn_08 then
					player:removeCustom("tab_nt")
					player:removeCustom("tab_kt")
					tn_08_t = nil
					tn_t_Z2 = tn_t_Z2 + 1
					player:addCustomInfo("engineering","tn_t_Z2_1","Zigaretten Kisten an Bord")
				elseif tn_01_t == nil and tn_02_t == nil and tn_03_t == nil and tn_04_t == nil and tn_05_t == nil and tn_06_t == nil and tn_07_t == nil and tn_08_t == nil then
					player:removeCustom("tabak_suche")
					player:removeCustom("tab_nt")
					player:removeCustom("tab_kt")
				elseif tabaktar == nil then
					player:removeCustom("tab_kt")
					player:addCustomButton("science","tab_nt","Kein Ziel")
				else
					player:removeCustom("tab_nt")
					player:addCustomButton("science","tab_kt","Kein Tabak")
				end
			end)
		end)
		addCommsReply("Wir kommen darauf zur�ck.",function()
			setCommsMessage("Verstanden.")
		end)
	end
end

function LA_02_5_call() -- Script f�r Transport 5 -- Virus-Upload
	if LA_02_5 == nil then
		Transport_5:setCommsScript("comms_ship.lua")
	end
	
	if LA_02_5 == 1 then
		setCommsMessage([[Hier spricht der Kapit�n der UH Pyrox, wir suchen jemanden f�r einen,...

... nicht ganz Legalen Auftrag wenn sie verstehen was ich meine,... Sie wissen nicht zuf�llig wo ich so jemanden finde ohne mich an die Piraten zu verweisen?]])
		addCommsReply("Gefunden! Was soll denn getan werden?", function()
			LA_02_5 = 3
			ER_10_8 = 8
			setCommsMessage("Wir wollen einem anderen H�ndler einen Auftrag wegschnappen, dies gelingt uns jedoch nur wenn wir eher beim Auftraggeber ankommen als Sie. Wir �bermitteln ihnen nun einen Virus, schleusen sie den Virus in die UH Nostromo ein, dieser sollte ihren Antrieb besch�digen. Ich denke sie kennen sich mit Frequenzangleichungen von Schilden aus, sprechen sie die UH Nostromo dann an. Bei Erf�llung des Auftrags erhalten sie 1000 Reputation. Viel Gl�ck!") --Transport_08
		end)
		addCommsReply("Wir melden uns falls wir solches Gesindel treffen sollten.", function()
			LA_02_5 = 2
		end)
	end
	
	if LA_02_5 == 2 then
		setCommsMessage("Haben sie jemanden f�r meinen Auftrag gefunden?")
	end
	
	if LA_02_5 == 3 then
		setCommsMessage("Haben sie den Auftrag schon erledigt?")
	end
end

function commsHackedShipCompare2() -- Gleicht die Schildfrequenzen beider Schiffe ab --
    frequency1 = 400 + (comms_target:getShieldsFrequency() * 20)
	frequency2 = 400 + (comms_source:getShieldsFrequency() * 20)
	if (frequency1 == frequency2) and player:getShieldsActive() then
        setCommsMessage("---Frequenzabgleich war erfolgreich---")
        addCommsReply("Wissenschaftsoffizier Backdoor �ffnen", function()
			setCommsMessage("---Backdoor f�r den Wissenschaftsoffizier ge�ffnet---")
			player:addCustomButton("science","virus_pass", "Vorbereiteter Hack", function()
				comms_target:setSystemHealth("impulse", -90):setSystemHealth("maneuver", -90):setSystemHealth("reactor", -90):orderDock(earthstation1)
				player:addReputationPoints(1000)
				LA_02_5 = nil
				player:removeCustom("virus_pass")
				ER_10_8_hack = nil
				UH_Check = UH_Check + 1
			end)
        end)  
	else
        setCommsMessage([[---Frequenzabgleich war erfolglos---]])
			addCommsReply("---Frequenz erneut abgleichen---", function()
			commsHackedShipCompare2()
		end)
	end
end

function WC_26_6_call() -- Script f�r Transport_6 -- Erst-Mission
	
	if comm_stat == nil then
		Transport_6:setCommsScript("comms_ship.lua")
	end
	
	if comm_stat == 1 then -- Notruf bekommen --
		setCommsMessage([[Autom#'ischer N07ruf der 9H =r~�ona
	
Auafsll der Trirewbeke, begit�nen dregnind Hefli. Die Comtsysretupeme spleien vekc�rrt, Sednen sie eenin Res0n4nz1mpul5 �ebr irhe 5ch1lde!
Deis stlloe das Comsysretuptem aus der Feeelhcskcabdife brnneen und kalletstlen dimat wir es euenrt sttraen k�ennn.

M3ld3n 513 s1ch euenrt an wnen sie un73r 3U haren sdni.]])
				addCommsReply("UH Arizona, wir haben ihren Notruf erhalten.", function()
					comm_stat = 2
					setCommsMessage("=/98(�?��'+987da;")
				end)
				
	end
	
	if distance(comms_source, comms_target) < 3000 and comm_stat == 2 then -- Schiff in Reichweite und Frequenz abgleich --
        setCommsMessage([[Gut jetzt da sie n�her dran sind, k�nnen wir mit den Pers�nlichen Comms kommunizieren. 

Bitte aktivieren sie ihre Schilde in der korrekten Frequenz. Ihr Wissenschaftsoffizer sollte in der Lage sein unsere genau Frequenz festzustellen.
Sind die Schilde aktiv und die korrekte Frequenz eingestellt worden, lassen sie den Waffenoffizier den Impuls senden.]]);
		addCommsReply("Frequenz abgleichen.", function()
			commsHackedShipCompare()
		end)
	end
	
	if distance(comms_source, comms_target) > 3000 and comm_stat == 2 then -- Schiff au�er Reichweite --
		setCommsMessage([[>>> Schiff au�er Reichweite <<<]])
	end
	
	if comm_stat == 3 then -- Notfall ereldigt --
		setCommsMessage("Hervorragende Arbeit! Die Maschiene l�uft wieder wie sie es soll!")
			addCommsReply("K�nnen wir ihnen noch anderweitig helfen?", function()
				setCommsMessage([[Nein vielen Dank! 
				
UH Arizona Ende.]])
				comm_stat = nil
				UH_Check = UH_Check + 1
				mission_state = 2
			end)
			addCommsReply("Lassen sie ihren Schrotthaufen �berholen!", function()
				setCommsMessage([[Haben Verstanden. Das geht aber auch freundlicher.

UH Arizona Ende.]])
				player:takeReputationPoints(50.0)
				comm_stat = nil
				UH_Check = UH_Check + 1
				mission_state = 2
			end)
	end
end

function commsHackedShipCompare() -- Gleicht die Schildfrequenzen beider Schiffe ab --
    frequency1 = 400 + (comms_target:getShieldsFrequency() * 20)
	frequency2 = 400 + (comms_source:getShieldsFrequency() * 20)
	if (frequency1 == frequency2) and player:getShieldsActive() then
        setCommsMessage("Frequenzabgleich war erfolgreich.")
        addCommsReply("Impulsfreigabe f�r den Waffenoffizier", function()
			setCommsMessage("Senden sie den Impuls und kontaktieren sie uns danach wieder!")
			player:addCustomButton("weapons","IMPULS_SHILD", "IMPULS", function()
				comms_target:setSystemHealth("impulse", 0):setSystemHealth("maneuver", 0):orderDock(earthstation1):setImpulseMaxSpeed(35)
				player:addReputationPoints(250.0)
				comm_stat = 3
				player:removeCustom("IMPULS_SHILD")
			end)
        end)  
	else
        setCommsMessage([[Frequenzabgleich war erfolglos!

Stellen sie sicher das ihre Schilde aktiviert sind und die richtige Frequenz eingestellt wurde.]])
			addCommsReply("Frequenz erneut abgleichen.", function()
			commsHackedShipCompare()
		end)
	end
end

function JS_08_7_call() -- Script f�r Transport 7 -- Piratenjagt
	if JS_08_7 == nil then
		Transport_7:setCommsScript("comms_ship.lua")
	end
	
	if JS_08_7 == 1 then
		setCommsMessage([[Ahoi! Mein Name ist Captain Sluk. Wie kann ich euch zu Diensten sein?]])
		addCommsReply("Gegenfrage, wie k�nnen wir ihnen zu Diensten sein?", function()
			JS_08_7 = 2
			setCommsMessage("Um ehrlich zu sein. Die Piraten haben im Asteroideng�rtel einige Kampfdrohnen versteck. K�nnten sie diese zerst�ren? Sie erhalten f�r die zerst�rung aller Drohnen 1000 Rep.")
			addCommsReply("Ein Kinderspiel. Wo sind die Drohnen genau?",function()
				JS_08_7 = 3
			    crab_01 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-01"):setPosition(125209, -48168):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
				crab_02 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-02"):setPosition(124144, -47976):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
				crab_03 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-03"):setPosition(119488, -49079):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
				crab_04 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-04"):setPosition(115987, -49977):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
				crab_05 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-05"):setPosition(114776, -49877):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
				crab_06 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-06"):setPosition(117270, -49793):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
				crab_07 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-07"):setPosition(121477, -49516):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
				crab_08 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-08"):setPosition(123235, -49568):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
				setCommsMessage("In den Quadraten C10 und C11 ist ein Schwarm der sich auf und ab bewegt. Melden sie sich wenn die Mission abgeschlossen wurde. Gute Jagt!")
			end)
			addCommsReply("Wir k�mmern uns ein andermal drum.",function()
				setCommsMessage("Verstanden.")
			end)
		end)
	end
	
	if JS_08_7 == 2 then
		setCommsMessage("Sind sie nun bereit sich der Drohnen anzunehmen?")
		addCommsReply("Ein Kinderspiel. Wo sind die Drohnen genau?",function()
			JS_08_7 = 3
		    crab_01 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-01"):setPosition(125209, -48168):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
			crab_02 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-02"):setPosition(124144, -47976):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
			crab_03 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-03"):setPosition(119488, -49079):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
			crab_04 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-04"):setPosition(115987, -49977):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
			crab_05 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-05"):setPosition(114776, -49877):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
			crab_06 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-06"):setPosition(117270, -49793):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
			crab_07 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-07"):setPosition(121477, -49516):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
			crab_08 = CpuShip():setFaction("Piraten"):setTemplate("Fighter"):setCallSign("Crab-08"):setPosition(123235, -49568):setHullMax(30):setHull(30):setShieldsMax(30.00):setShields(30.00):orderDefendLocation(120000,-50000)
			setCommsMessage("In den Quadraten C10 und C11 ist ein Schwarm der sich auf und ab bewegt. Melden sie sich wenn die Mission abgeschlossen wurde. Gute Jagt!")
		end)
		addCommsReply("Wir k�mmern uns ein andermal drum.",function()
			setCommsMessage("Verstanden.")
		end)
	end
	
	if JS_08_7 == 3 then
		if crab_01:isValid() == false and crab_02:isValid() == false and crab_03:isValid() == false and crab_04:isValid() == false and crab_05:isValid() == false and crab_06:isValid() == false and crab_07:isValid() == false and crab_08:isValid() == false then
			setCommsMessage("Gute Arbeit! Hier die versprochenen Reputationspunkte!")
			player:addReputationPoints(1000)
			JS_08_7 = nil
			UH_Check = UH_Check + 1
		else
			setCommsMessage("Erst die Arbeit, dann die Reputationspunkte!")
		end
	end
end

function ER_10_8_call() -- Script f�r Transport 8 -- Alien�bernahme
	
	if ER_10_8 == nil then
		Transport_8:setCommsScript("comms_ship.lua")
	end
	
	if ER_10_8 == 1 and ER_10_8_hack == 1 then
		setCommsMessage("Kapit�n Coblenz hier, wir sind auf dem Weg zur Asteroiden-Station im Auftrag der >Weyland-Yutani Corporation<. Weshalb rufen sie uns?")
		addCommsReply("H�tten sie f�r uns einen Auftrag?.",function()
			setCommsMessage("Tut uns Leid, wir haben leider keinen Auftrag f�r sie. Erkundigen sie sich sp�ter nocheinmal. UH Nostromo Ende.")
			ER_10_8 = 2
		end)
	elseif ER_10_8 == 1 and ER_10_8_hack == nil then
		setCommsMessage("---Keine Reaktion---")
		Transport_8:setFaction("Alien (Feindlich)")
		ER_10_8 = 3
	end
	
	if ER_10_8 == 2 and ER_10_8_hack == 1 then
		setCommsMessage("Wir haben immer noch keinen Auftrag f�r sie, aber versuchen sie es sp�ter nocheinmal. UH Nostromo Ende.")
	elseif ER_10_8 == 2 and ER_10_8_hack == nil then
		setCommsMessage("---Keine Reaktion---")
		Transport_8:setFaction("Alien (Feindlich)")
		ER_10_8 = 3
	end
	
	if ER_10_8 == 3 then
		setCommsMessage("---Keine Reaktion---")
	end
	
	if distance(comms_source, comms_target) < 3000 and ER_10_8 == 8 then -- Schiff in Reichweite und Frequenz abgleich --
        setCommsMessage([[K�nnen wir ihnen weiterhelfen? Wir sind besch�ftigt! Eines unserer Tiere ist ausgebrochen. Wir k�nnen uns keine Ablenkung erlauben.]]);
		addCommsReply("Ja sicher, verzeihung, viel Gl�ck bei ihrem Problem! (Frequenz abgleichen)", function()
			commsHackedShipCompare2()
		end)
	end
	
	if distance(comms_source, comms_target) > 3000 and ER_10_8 == 8 then -- Schiff au�er Reichweite --
		setCommsMessage([[>>> Schiff au�er Reichweite <<<]])
	end
end

function CD_22_9_call() -- Script f�r Transport 9 -- Maschienenjagt
	if CD_22_9 == nil then
		Transport_9:setCommsScript("comms_ship.lua")
	end

	if CD_22_9 == 1 then
		setCommsMessage([[Chalo, wie giets ihnen? Ki�nnten sie unz etwas chelfen? Uunsere Wertstioff-Androiden chaben leider Systiem-Fehler,... Ki�nnten sie sich um diese ki�mmern f�r sagen wir, 1000 Rep. und eine Fliasche Vodka?]])
		addCommsReply("Klar, wo sind die Defekten-Maschienen?",function()
			CD_22_9 = 3
				wsa_01 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-01"):setPosition(157482, 37056):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_02 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-02"):setPosition(158335, 37643):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_03 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-03"):setPosition(157518, 37767):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_04 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-04"):setPosition(156736, 37803):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_05 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-05"):setPosition(157305, 38265):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_06 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-06"):setPosition(155679, 38788):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_07 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-07"):setPosition(155243, 39456):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_08 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-08"):setPosition(156060, 39669):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_09 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-09"):setPosition(156238, 38745):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_10 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-10"):setPosition(157145, 38958):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
			setCommsMessage("Chervorragend! Mielden sie sich wieder wenn die Werstioff-Androiden zersti�rt wurden.")
		end)
		addCommsReply("Wir kommen sp�ter darauf zur�ck.",function()
			setCommsMessage("Verstianden.")
			CD_22_9 = 2
		end)
	end
	
	if CD_22_9 == 2 then
		setCommsMessage("Und? Chaben sie nun Zeit unz zu chelfen?")
		addCommsReply("Klar, wo sind die Defekten-Maschienen?",function()
			CD_22_9 = 3
				wsa_01 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-01"):setPosition(157482, 37056):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_02 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-02"):setPosition(158335, 37643):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_03 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-03"):setPosition(157518, 37767):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_04 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-04"):setPosition(156736, 37803):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_05 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-05"):setPosition(157305, 38265):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_06 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-06"):setPosition(155679, 38788):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_07 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-07"):setPosition(155243, 39456):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_08 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-08"):setPosition(156060, 39669):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_09 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-09"):setPosition(156238, 38745):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
				wsa_10 = CpuShip():setFaction("KI-Systemfehler"):setTemplate("Fighter"):setCallSign("WSA-10"):setPosition(157145, 38958):orderDefendLocation(157305, 38265):setShieldsMax(40.00):setShields(40.00):setBeamWeapon(0, 60, 0, 1000, 2, 3):setBeamWeaponTurret(0, 0, 0, 0)
			setCommsMessage("Chervorragend! Mielden sie sich wieder wenn die Werstioff-Androiden zersti�rt wurden.")
		end)
		addCommsReply("Wir kommen sp�ter darauf zur�ck.",function()
			setCommsMessage("Verstianden.")
		end)
	end
	
	if CD_22_9 == 3 and wsa_01:isValid() == false and wsa_02:isValid() == false and wsa_03:isValid() == false and wsa_04:isValid() == false and wsa_05:isValid() == false and wsa_06:isValid() == false and wsa_07:isValid() == false and wsa_08:isValid() == false and wsa_09:isValid() == false and wsa_10:isValid() == false then
		setCommsMessage("Chiaben Sie vielen Dank!")
		CD_22_9 = nil
		player:addReputationPoints(1000)
		UH_Check = UH_Check + 1
	--else
		--setCommsMessage("Wir kriegen immernoch Diaten von den Werstioff-Androiden!")
	end
end

function PK_12_10_call() -- Script f�r Transport 10 -- Waffenh�ndler
	if PK_12_10 == nil then
		Transport_10:setCommsScript("comms_ship.lua")
	end
	
	if PK_12_10 == 1 then
		setCommsMessage("Unser Reaktor hat ein Problem. K�nnten sie eine Nuke er�brigen? Wir w�rden ihnen 500 Rep. daf�r anbieten, dann verlieren wir nicht unsere Lizens...")
		addCommsReply("Deal.",function()
			PK_12_10 = 3
			setCommsMessage("In Ordnung! Kommen sie auf 2U an uns ran und senden sie uns die Nuke r�ber, dann erhalten sie die 500 Rep.")
			player:addCustomButton("weapons","nukesend","Nuke senden",function()
				if distance(player,Transport_10) <= 2000 and player:getWeaponStorageMax("Nuke") >= 1 then
					PK_12_10 = nil
					math.nuke = player:getWeaponStorage("Nuke")
					math.nuke = math.nuke - 1
					player:setWeaponStorage("Nuke", math.nuke)
					player:removeCustom("nukesend")
					player:removeCustom("info_nukesend")
					UH_Check = UH_Check + 1
				else
					player:addCustomInfo("weapons","info_nukesend","Au�er Reichweite oder zuwenig Nukes")
				end
			end)
		end)
		addCommsReply("Wir kommen darauf zur�ck.", function()
			setCommsMessage("Verstanden.")
			PK_12_10 = 2
		end)
	end
	
	if PK_12_10 == 2 then
		setCommsMessage("Kommen sie nun zu uns?")
		addCommsReply("Deal.",function()
			PK_12_10 = 3
			setCommsMessage("In Ordnung! Kommen sie auf 2U an uns ran und senden sie uns die Nuke r�ber, dann erhalten sie die 500 Rep.")
			player:addCustomButton("weapons","nukesend","Nuke senden",function()
				if distance(player,Transport_10) <= 2000 and player:getWeaponStorageMax("Nuke") >= 1 then
					PK_12_10 = nil
					math.nuke = player:getWeaponStorage("Nuke")
					math.nuke2 = math.nuke - 1
					player:setWeaponStorage("Nuke", math.nuke2)
					player:removeCustom("nukesend")
					player:removeCustom("info_nukesend")
					UH_Check = UH_Check + 1
				else
					player:addCustomInfo("weapons","info_nukesend","Au�er Reichweite oder zuwenig Nukes")
				end
			end)
		end)
		addCommsReply("Wir kommen darauf zur�ck.", function()
			setCommsMessage("Verstanden.")
			PK_12_10 = 2
		end)
	end
	
	if PK_12_10 == 3 then
		setCommsMessage("Wir warten auf sie!")
	end
end

function SJ_11_11_call() -- Script f�r Transport 11 -- IN ARBEIT
	if SJ_11_11 == nil then
		Transport_11:setCommsScript("comms_ship.lua")
	end
end

function PU_06_12_call() -- Script f�r Transport 12 -- IN ARBEIT
	if PU_06_12 == nil then
		Transport_12:setCommsScript("comms_ship.lua")
	end
end

function LE_05_13_call() -- Script f�r Transport 12 -- IN ARBEIT
	if LE_05_13 == nil then
		Transport_13:setCommsScript("comms_ship.lua")
	end
end

function missionStartState() -- L�sste TN Alpharius das Spielerschiff rufen --
-- Missions Beginn --
earthstation1:openCommsTo(player)
-- Missions Ende --
end

function dax_wissens() -- Wissenschaftler bietet Option auf K�hlmittel Trick --
	if dax_da == 1 then
		player:addCustomMessage("engineering","eng_inf", [[Der Wissenschaftler Dax bietet ihnen an, im gegenzug das sie ihn nicht der MTU ausliefern, das Schiff mit seiner Erfindung zu verbessern.

Er w�rde das K�hlmittelsystem so umkonfigurieren das man 1/3 des K�hlmittles aussto�en kann, was sofort die Hitze der Systeme auf 0 abk�hlt. Zudem w�rde ein kurzlebiger Nebel entstehen.
Diese Konfiguration k�nnte nur durch einen "override" des Wissenschaftsoffiziers genutzt werden.

Optionen: 
1 - Deal von Dax eingehen.
2 - Deal von Dax eingehen, Dax hintergehen und sp�ter doch ausliefern.
3 - Deal nicht eingehen.
(Nachricht nicht schlie�en! Option auf der rechten Seite w�hlen.)]])
		player:addCustomButton("engineering","dax_ja","1", function()
			player:addReputationPoints(200.0)
			player:removeCustom("eng_inf")
			player:removeCustom("dax_ja")
			player:removeCustom("dax_hinter")
			player:removeCustom("dax_nein")
			coolant_f()
			wissens_count = (wissens_count - 1)		
		end)
		player:addCustomButton("engineering","dax_hinter","2", function()
			player:removeCustom("eng_inf")
			player:removeCustom("dax_ja")
			player:removeCustom("dax_hinter")
			player:removeCustom("dax_nein")
			coolant_f()
			player:takeReputationPoints(200.0)
		end)
		player:addCustomButton("engineering","dax_nein","3",function()
			player:removeCustom("eng_inf")
			player:removeCustom("dax_ja")
			player:removeCustom("dax_hinter")
			player:removeCustom("dax_nein")
		end)
	end
	dex_da = nil
end

function wissens_fang() -- Erm�glicht nach erfolgreichem Scan den Wissenschaftler ab 3U zu fassen --
	player:addCustomButton("weapons", "ge_sci_wiss_da", "Daten von Science", function()
		player:removeCustom("p_dax")
		player:removeCustom("ge_sci_wiss_da")
		player:addCustomButton("weapons", "in_reach", "Person erfassen", function()
			if distance(player,wissenschaftler) < 3000 and wissens_activ == 2 then
				player:removeCustom("tartoofar")
				player:addCustomInfo("weapons","tarclose","Ziel in Reichweite")
				player:addCustomButton("weapons","tac_wiss_fest","Wissenschaftler festnehmen", function()
					if distance(player,wissenschaftler) < 3000 then
						player:removeCustom("tac_wiss_fest")
						player:removeCustom("tarclose")
						player:removeCustom("tartoofar")
						player:removeCustom("in_reach")
						dax_wissens()
						wissens_count = wissens_count + 1
					else
						player:addCustomInfo("weapons","tartoofar","Ziel au�er Reichweite")
						player:removeCustom("tarclose")
					end
				end)
			else
				player:addCustomInfo("weapons","tartoofar","Ziel au�er Reichweite")
			end
		end)
	end)
end

function coolant_f() -- K�hlmittel Trick --
-- K�hlmittel Aussto� --
	coolant = 0 -- Werte f�r das K�hlmittelscript am Ende
	coolant_lvl = nil
	player:addCustomMessage("engineering","erklarungEKA","Beim aus�to� von K�hlmittel wird 30% der maximalen Menge ausgesto�en.")
	player:addCustomButton("engineering", "Coolant_Override", "K�hlmittel aussto�en", function()
		if coolant == nil then coolant = 0 end
		coolant = coolant + 1
		if coolant == 1 then					
			for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}) do
			player:setSystemHeat(system, 0.0)
			end
			player:removeCustom("Coolant_Info0")
			player:addCustomInfo("engineering","Coolant_Info1","K�hlmittel: 70%")
			x_player, y_player = player:getPosition()
			neb1 = Nebula():setPosition(x_player, y_player)
			coolant_lvl = 3
		end
		if coolant == 2 then
			coolant_lvl = 6
			for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}) do
			player:setSystemHeat(system, 0.0)
			end
			player:removeCustom("Coolant_Info1")
			player:addCustomInfo("engineering","Coolant_Info2","K�hlmittel: 40%")
			x_player, y_player = player:getPosition()
			neb2 = Nebula():setPosition(x_player, y_player)
		end
		if coolant == 3 then
			coolant_lvl = 9
			for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}) do
			player:setSystemHeat(system, 0.0)
			end
			player:removeCustom("Coolant_Info2")
			player:addCustomInfo("engineering","Coolant_Info3","K�hlmittel: 10%")
			x_player, y_player = player:getPosition()
			neb3 = Nebula():setPosition(x_player, y_player)
			player:removeCustom("Coolant_Override")
		end
	end)
-- Ende K�hlmittel Aussto� --
end

function coolentdecisiontaker()
	-- Entscheidung welches "nicht vorhandene" Schiffssystem zum K�hlmittel abzug benutzt wird. --
	if coolant_lvl ~= nil then
		if player:hasJumpDrive() then
		player:commandSetSystemCoolantRequest("warp", coolant_lvl)
		else
		player:commandSetSystemCoolantRequest("jumpdrive", coolant_lvl)
		end
	end	
	-- Ende der Entscheidung --
end

function kuehlmittelaufnahme()
-- K�hlmittel aufnahme --
	if coolant ~= nil and coolant > 0 then
		local x0,y0 = player:getPosition()
		local dummy_station = 0
		for _, obj in ipairs(getObjectsInRadius(x0,y0,1500)) do
			if obj.typeName == "SpaceStation" then 
				dummy_station = 1
				dockstation = obj
			end
		end
		if dummy_station == 1 and player:isDocked(dockstation) then
			player:addCustomButton("relay","Coolant_Intake", "K�hlmittel aufnehmen", function()
				player:removeCustom("Coolant_Info1")
				player:removeCustom("Coolant_Info2")
				player:removeCustom("Coolant_Info3")
				player:addCustomInfo("engineering","Coolant_Info0","Coolant: 100%")
				coolant = 0
				coolant_lvl = nil
				player:removeCustom("Coolant_Intake")
			end)
		else
			player:removeCustom("Coolant_Intake")
		end
	end
	-- Ende K�hlmittel aufnahme --
end

function aliencomms() -- Abhandlung des Treffens mit den Aliens --
	if alien_state == 1 then
		setCommsMessage("/sION6541 51846?00�  =?6&%%%jn7 846as8 d462e (7777 (%fmdsl =mklnf -*+'##sdf")
			addCommsReply("Nachricht an Wissenschaftsoffizier weiterleiten.", function()
				player:addCustomButton("weapons", "alien_tar", "Ziel als Feind Markieren", function()
					alien_01:setFaction("Alien (Feindlich)")
					alien_state = 9
				end)
				setCommsMessage("Nachricht an Wissenschaftsoffizier weiter geleitet.")
				player:addCustomButton("science", "alien_scrambel_01", "Nachricht entschl�sseln.", function()
					player:removeCustom("alien_scrambel_01")
					player:addCustomMessage("science", "alien_sc_info01", "Wir 51846?00�  in 846as8 d462e beabsichtigen euch =mklnf anzugreifen.")
					player:addCustomButton("science", "alien_scrambel_02", "Nachricht entschl�sseln.", function()
						player:removeCustom("alien_scrambel_02")
						player:removeCustom("alien_sc_info01")
						player:addCustomMessage("science", "alien_sc_info02", "Wir kommen  in 846as8 und beabsichtigen euch =mklnf anzugreifen.")
						player:addCustomButton("science", "alien_scrambel_03", "Nachricht entschl�sseln.", function()
							player:removeCustom("alien_scrambel_03")
							player:removeCustom("alien_sc_info02")
							player:addCustomMessage("science", "alien_sc_info03", "Wir kommen in Frieden und beabsichtigen euch nicht anzugreifen.")
							player:addCustomButton("science", "alien_scrambel_04", "�bersetzungsalgorythmus an Comms senden.", function()
								player:removeCustom("alien_scrambel_04")
								player:removeCustom("alien_sc_info03")
								alien_state = 2
								player:removeCustom("alien_tar")
							end)
						end)
					end)
				end)
			end)
	end
	
	if alien_state == 2 then
	setCommsMessage([[Hier ist der Kommandant der Shapiron.

K�nnen sie uns verstehen?]])
		addCommsReply("Ja wir k�nnen sie verstehen! Willkommen im Sol-System.", function()
			alien_state = 3
			setCommsMessage("Wir sind erfreut sie kennen zu lernen. K�nnten sie uns mit ein paar Teilen aushelfen?")
				addCommsReply("Schicken sie uns eine Liste der ben�tigten Teile und wir sehen was wir tun k�nnen.", function()
					setCommsMessage("Liste wird �bertragen. Melden sie sich erneut wenn sie die Teile gesendet haben.")
					player:addCustomButton("engineering", "alien_liste", "Inventar-Pr�fung", function()
						player:removeCustom("alien_liste")
						player:addCustomInfo("engineering", "invent_prf", "Material vorhanden.")
						player:addCustomButton("engineering", "alien_send", "Material senden", function()
							player:removeCustom("invent_prf")
							player:removeCustom("alien_send")
							alien_state = 4
						end)
					end)
				end)
				addCommsReply("Wir kehren in k�rze zur�ck und nehmen mit ihnen wieder Kontakt auf.", function()
					setCommsMessage("Wir warten auf ihre R�ckkehr!")
				end)
				addCommsReply("Wir trauen ihnen leider nicht. Senden sie keine Daten!",function()
					alien_state = 8
					setCommsMessage("Verstanden.")
				end)
		end)
		addCommsReply("Lassen sie ihre Schilde runter und �bergeben sie das Schiff.", function()
			alien_01:setFaction("Alien (Feindlich)")
			alien_state = 9
			setCommsMessage("Sie sind eine wiederw�rtige Spezies. Wir werden sie ausrotten.")
		end)
	end
	
	if alien_state == 3 then
		setCommsMessage("K�nnen sie uns nun mit ein paar Teilen aushelfen?")
		addCommsReply("Schicken sie uns eine Liste der ben�tigten Teile und wir sehen was wir tun k�nnen.", function()
					setCommsMessage("Liste wird �bertragen. Melden sie sich erneut wenn sie die Teile gesendet haben.")
					player:addCustomButton("engineering", "alien_liste", "Inventar-Pr�fung", function()
						player:removeCustom("alien_liste")
						player:addCustomInfo("engineering", "invent_prf", "Material vorhanden.")
						player:addCustomButton("engineering", "alien_send", "Material senden", function()
							player:removeCustom("invent_prf")
							player:removeCustom("alien_send")
							alien_state = 4
						end)
					end)
				end)
				addCommsReply("Wir kehren in k�rze zur�ck und nehmen mit ihnen wieder Kontakt auf.", function()
					setCommsMessage("Wir warten auf ihre R�ckkehr!")
				end)
				addCommsReply("Wir trauen ihnen leider nicht. Senden sie keine Daten!",function()
					alien_state = 8
					setCommsMessage("Verstanden.")
				end)
	end
	
	if alien_state == 4 then
		setCommsMessage("Vielen Dank f�r die Materialien, wir w�rden ihnen gerne anbieten einen alternativen Antrieb einzubauen. M�chten sie einen Sprungantrieb statt ihres Warpantriebs erhalten?")
		addCommsReply("Wir w�rden den Sprungantrieb gerne annehmen.", function()
			alien_state = 6
			player:setWarpDrive(false):setJumpDrive(true)
			setCommsMessage("Schon erledigt.")
		end)
		addCommsReply("Wir kommen darauf zur�ck.", function()
			alien_state = 5
			setCommsMessage("Wir sind noch eine Weile hier uns sammeln Wissenschaftliche Daten.")
		end)	
	end
	
	if alien_state == 5 then
		setCommsMessage("M�chten sie nun den Sprungantrieb erhalten?")
		addCommsReply("Wir w�rden den Sprungantrieb nun gerne annehmen.", function()
			alien_state = 6
			player:setWarpDrive(false):setJumpDrive(true)
			setCommsMessage("Schon erledigt.")
		end)
		addCommsReply("Wir kommen darauf zur�ck.", function()
			setCommsMessage("Wir sind noch eine Weile hier uns sammeln Wissenschaftliche Daten.")
		end)	
	end
	
	if alien_state == 6 then
		setCommsMessage("Wir sammeln noch Wissenschaftliche Daten.")
	end
	
	if alien_state == 8 then
		setCommsMessage("Wir bedauern das sie uns nicht vertrauen.")
		addCommsReply("Wir haben es uns �berlegt. Wir sprechen sie gleich nochmal an.", function()
			alien_state = 3
			setCommsMessage("Wir erwarten ihre R�ckmeldung.")
		end)
		addCommsReply("Wir werden sie ausradieren.",function()
			alien_01:setFaction("Alien (Feindlich)")
			alien_state = 9
			setCommsMessage("Sie sind eine wiederw�rtige Spezies. Wir werden sie ausrotten.")
		end)
	end
	
	if alien_state == 9 then
		setCommsMessage("Sie sind eine wiederw�rtige Spezies. Wir werden sie ausrotten.")
	end
end

function tortuga_comms() -- Script f�r Reaktion der Tortuga-Station --
	if pircom == 1 then -- Erstkontakt mit Piraten + M�glichkeit Pirat zu werden + M�glichkeit Station zu kaufen wenn Piraten = Alliierte --
		setCommsMessage([[Station Tortuga hier, Nennen sie das Codewort.]])
		addCommsReply("Captain Morgan!", function()
			setCommsMessage([[-- Verbindung Unterbrochen--]])
		end)
		addCommsReply("Arrrrrrrrrr,... Aye?", function()
			pircom = 2
			setCommsMessage([[Frequenz und ID des Schiffs der Datenbank hinzugef�gt.

Willkommen auf unserer Insel der Freiheit, wie k�nnen wir ihnen behilflich sein?]])
			addCommsReply("Der Kerl vom Ding mit dem Ding meinte es gibt Service-Leistungen?", function()
				setCommsMessage([[F�r eine gewisse Summe an Rep. versehen wir sie mit einer Falschen Schiffs ID und den Fraktions Daten der Piraten.
				
Auf diese weise k�nnen sie auf Karperfahrt gehen ohne das ihr wahrer Name ersichtlich wird.

Wenn sie ihren alten Status wieder haben m�chten brauchen sie sich nur wieder bei uns Melden. Sorgen sie aber daf�r das niemand in ihrer direkten (5U) Umgebung ist.]])
				addCommsReply("Was soll der Spa� kosten?", function()
					setCommsMessage("200 Rep.")
					addCommsReply("Deal", function()
						if player:getReputationPoints() >= 200 then
						player:takeReputationPoints(200)
						pircom = 3
						player:setCallSign("Kugelfisch"):setFaction("Piraten")
						setCommsMessage("Willkommen auf der anderen Seite.")
						else
						setCommsMessage("Sie haben nicht genug Rep.")
						end	
					end)
					addCommsReply("Wir kommen darauf zur�ck. Ende.", function()
						setCommsMessage("Verstanden, Tortuge Ende.")
					end)
				end)
				if uranusstation1:getFaction() == "Piraten (Alliierte)" and pirchance < 3 then
					addCommsReply("Tortuge, wir w�rden euch gern ein Angebot machen.", function()
						setCommsMessage("... wir h�ren ...")
						addCommsReply("500 Rep. und die Station geh�rt der TN.",function()
							setCommsMessage("Wir w�rden niemals unsere Freiheit aufgeben! Erster Strike!")
							pirchance = pirchance + 1
							addCommsReply("1000 Rep. und die Station geh�rt der TN.",function()
								pirchance = pirchance + 1
								setCommsMessage("Zweiter Strike, wir geben ihnen noch eine Chance...")
								addCommsReply("1500 Rep.",function()
									pirchance = pirchance + 1
									setCommsMessage("-- Verbindung Unterbrochen --")
								end)
								addCommsReply("2000 Rep.",function()
									setCommsMessage("Deal.")
									uranusstation1:setFaction("Terranische Navy")
									pirchance = pirchance + 1
								end)
								addCommsReply("2500 Rep.",function()
									setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
									uranusstation1:setFaction("Terranische Navy")
									pirchance = pirchance + 1
								end)
							end)
							addCommsReply("1500 Rep.",function()
								pirchance = pirchance + 1
								setCommsMessage("Zweiter Strike, wir geben ihnen noch eine Chance...")
								addCommsReply("2000 Rep.",function()
									setCommsMessage("Deal.")
									uranusstation1:setFaction("Terranische Navy")
									pirchance = pirchance + 1
								end)
								addCommsReply("2500 Rep.",function()
									setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
									uranusstation1:setFaction("Terranische Navy")
									pirchance = pirchance + 1
								end)
							end)
							addCommsReply("2000 Rep.",function()
								setCommsMessage("Deal.")
								uranusstation1:setFaction("Terranische Navy")
								pirchance = pirchance + 2
							end)
							addCommsReply("2500 Rep.",function()
								setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
								uranusstation1:setFaction("Terranische Navy")
								pirchance = pirchance + 2
							end)
						end)
						addCommsReply("1000 Rep. und die Station geh�rt der TN.",function()
							pirchance = pirchance + 1
							setCommsMessage("Wir w�rden niemals unsere Freiheit aufgeben! Erster Strike!")
							addCommsReply("1500 Rep.",function()
								pirchance = pirchance + 1
								setCommsMessage("Zweiter Strike, wir geben ihnen noch eine Chance...")
								addCommsReply("2000 Rep.",function()
									setCommsMessage("Deal.")
									uranusstation1:setFaction("Terranische Navy")
									pirchance = pirchance + 1
								end)
								addCommsReply("2500 Rep.",function()
									setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
									uranusstation1:setFaction("Terranische Navy")
									pirchance = pirchance + 1
								end)
							end)
							addCommsReply("2000 Rep.",function()
								setCommsMessage("Deal.")
								uranusstation1:setFaction("Terranische Navy")
								pirchance = pirchance + 2
							end)
							addCommsReply("2500 Rep.",function()
								setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
								uranusstation1:setFaction("Terranische Navy")
								pirchance = pirchance + 2
							end)
						end)
						addCommsReply("1500 Rep. und die Station geh�rt der TN.",function()
							pirchance = pirchance + 1
							setCommsMessage("Wir w�rden niemals unsere Freiheit aufgeben! Erster Strike!")
							addCommsReply("2000 Rep.",function()
								setCommsMessage("Deal.")
								uranusstation1:setFaction("Terranische Navy")
								pirchance = pirchance + 2
							end)
							addCommsReply("2500 Rep.",function()
								setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
								uranusstation1:setFaction("Terranische Navy")
								pirchance = pirchance + 2
							end)
						end)
						addCommsReply("2000 Rep. und die Station geh�rt der TN.",function()
							setCommsMessage("Deal.")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 3
						end)
						addCommsReply("2500 Rep. und die Station geh�rt der TN.",function()
							setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 3
						end)
					end)
				end
			end)
		end)
		addCommsReply("Tortuga", function()
			setCommsMessage([[-- Verbindung Unterbrochen--]])
		end)
		addCommsReply("Fischsuppe", function()
			setCommsMessage([[-- Verbindung Unterbrochen--]])
		end)
		addCommsReply("Grog!", function()
			setCommsMessage([[-- Verbindung Unterbrochen--]])
		end)
	end
	
	if pircom == 2 then -- M�glichkeit Pirat zu werden nach Erstkontakt mit Piraten + M�glichkeit Station zu kaufen wenn Piraten = Alliierte --
		setCommsMessage([[Station Tortuga hier,
		
Frequenz und Schiffs ID erkannt, wie k�nnen wir ihnen helfen?]])
		addCommsReply("Einmal eine Tarn-ID und die aktuellen Fraktions Codes bitte. (200 Rep.)", function()
			if player:getReputationPoints() >= 200 then
			player:takeReputationPoints(200)
			pircom = 3
			player:setCallSign("Kugelfisch"):setFaction("Piraten")
			setCommsMessage("Gute Jagt!")
			else
			setCommsMessage("Sie haben nicht genug Rep.")
			end
		end)
		if uranusstation1:getFaction() == "Piraten (Alliierte)" and pirchance < 3 then
			addCommsReply("Tortuge, wir w�rden euch gern ein Angebot machen.", function()
				setCommsMessage("... wir h�ren ...")
				addCommsReply("500 Rep. und die Station geh�rt der TN.",function()
					setCommsMessage("Wir w�rden niemals unsere Freiheit aufgeben! Erster Strike!")
					pirchance = pirchance + 1
					addCommsReply("1000 Rep. und die Station geh�rt der TN.",function()
						pirchance = pirchance + 1
						setCommsMessage("Zweiter Strike, wir geben ihnen noch eine Chance...")
						addCommsReply("1500 Rep.",function()
							pirchance = pirchance + 1
							setCommsMessage("-- Verbindung Unterbrochen --")
						end)
						addCommsReply("2000 Rep.",function()
							setCommsMessage("Deal.")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
						addCommsReply("2500 Rep.",function()
							setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
					end)
					addCommsReply("1500 Rep.",function()
						pirchance = pirchance + 1
						setCommsMessage("Zweiter Strike, wir geben ihnen noch eine Chance...")
						addCommsReply("2000 Rep.",function()
							setCommsMessage("Deal.")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
						addCommsReply("2500 Rep.",function()
							setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
					end)
					addCommsReply("2000 Rep.",function()
						setCommsMessage("Deal.")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
					addCommsReply("2500 Rep.",function()
						setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
				end)
				addCommsReply("1000 Rep. und die Station geh�rt der TN.",function()
					pirchance = pirchance + 1
					setCommsMessage("Wir w�rden niemals unsere Freiheit aufgeben! Erster Strike!")
					addCommsReply("1500 Rep.",function()
						pirchance = pirchance + 1
						setCommsMessage("Zweiter Strike, wir geben ihnen noch eine Chance...")
						addCommsReply("2000 Rep.",function()
							setCommsMessage("Deal.")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
						addCommsReply("2500 Rep.",function()
							setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
					end)
					addCommsReply("2000 Rep.",function()
						setCommsMessage("Deal.")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
					addCommsReply("2500 Rep.",function()
						setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
				end)
				addCommsReply("1500 Rep. und die Station geh�rt der TN.",function()
					pirchance = pirchance + 1
					setCommsMessage("Wir w�rden niemals unsere Freiheit aufgeben! Erster Strike!")
					addCommsReply("2000 Rep.",function()
						setCommsMessage("Deal.")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
					addCommsReply("2500 Rep.",function()
						setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
				end)
				addCommsReply("2000 Rep. und die Station geh�rt der TN.",function()
					setCommsMessage("Deal.")
					uranusstation1:setFaction("Terranische Navy")
					pirchance = pirchance + 3
				end)
				addCommsReply("2500 Rep. und die Station geh�rt der TN.",function()
					setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
					uranusstation1:setFaction("Terranische Navy")
					pirchance = pirchance + 3
				end)
			end)
		end
	end
	
	if pircom == 3 then -- M�glichkeit wieder TN zu werden --
		setCommsMessage([[Station Tortuga hier,
		
Frequenz und Schiffs ID erkannt, wie k�nnen wir ihnen helfen?]])
		 addCommsReply("Jagt Beendet.", function()
			if	player:areEnemiesInRange(5000) == false then
				player:setCallSign(PSHIPNAME):setFaction("Terranische Navy")
				setCommsMessage("Verstanden. Ende.")
				player:removeCustom("pir_att")
				player:removeCustom("pir_sh_on")
				player:removeCustom("pir_no_tar")
				player:removeCustom("pir_att_pos")
				pircom = 2
			else
				setCommsMessage("Es sind Schiffe in ihrer n�he. Versuchen sie es sp�ter noch einmal.")
			end
		 end)
	end
	
	if pircom == 4 then -- M�glichkeit Pirat zu werden nach Erstkontakt mit Piraten + M�glichkeit Station zu kaufen wenn Piraten = Alliierte --
		setCommsMessage([[Station Tortuga hier,
		
Frequenz und Schiffs ID erkannt, wie k�nnen wir ihnen helfen?]])
		addCommsReply("Einmal eine Tarn-ID und die aktuellen Fraktions Codes bitte. (200 Rep.)", function()
			if player:getReputationPoints() >= 200 then
			player:takeReputationPoints(200)
			pircom = 5
			player:setCallSign("Kugelfisch"):setFaction("Piraten (Alliierte)")
			setCommsMessage("Gute Jagt!")
			else
			setCommsMessage("Sie haben nicht genug Rep.")
			end
		end)
		if uranusstation1:getFaction() == "Piraten (Alliierte)" and pirchance < 3 then
			addCommsReply("Tortuge, wir w�rden euch gern ein Angebot machen.", function()
				setCommsMessage("... wir h�ren ...")
				addCommsReply("500 Rep. und die Station geh�rt der TN.",function()
					setCommsMessage("Wir w�rden niemals unsere Freiheit aufgeben! Erster Strike!")
					pirchance = pirchance + 1
					addCommsReply("1000 Rep. und die Station geh�rt der TN.",function()
						pirchance = pirchance + 1
						setCommsMessage("Zweiter Strike, wir geben ihnen noch eine Chance...")
						addCommsReply("1500 Rep.",function()
							pirchance = pirchance + 1
							setCommsMessage("-- Verbindung Unterbrochen --")
						end)
						addCommsReply("2000 Rep.",function()
							setCommsMessage("Deal.")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
						addCommsReply("2500 Rep.",function()
							setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
					end)
					addCommsReply("1500 Rep.",function()
						pirchance = pirchance + 1
						setCommsMessage("Zweiter Strike, wir geben ihnen noch eine Chance...")
						addCommsReply("2000 Rep.",function()
							setCommsMessage("Deal.")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
						addCommsReply("2500 Rep.",function()
							setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
					end)
					addCommsReply("2000 Rep.",function()
						setCommsMessage("Deal.")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
					addCommsReply("2500 Rep.",function()
						setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
				end)
				addCommsReply("1000 Rep. und die Station geh�rt der TN.",function()
					pirchance = pirchance + 1
					setCommsMessage("Wir w�rden niemals unsere Freiheit aufgeben! Erster Strike!")
					addCommsReply("1500 Rep.",function()
						pirchance = pirchance + 1
						setCommsMessage("Zweiter Strike, wir geben ihnen noch eine Chance...")
						addCommsReply("2000 Rep.",function()
							setCommsMessage("Deal.")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
						addCommsReply("2500 Rep.",function()
							setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
							uranusstation1:setFaction("Terranische Navy")
							pirchance = pirchance + 1
						end)
					end)
					addCommsReply("2000 Rep.",function()
						setCommsMessage("Deal.")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
					addCommsReply("2500 Rep.",function()
						setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
				end)
				addCommsReply("1500 Rep. und die Station geh�rt der TN.",function()
					pirchance = pirchance + 1
					setCommsMessage("Wir w�rden niemals unsere Freiheit aufgeben! Erster Strike!")
					addCommsReply("2000 Rep.",function()
						setCommsMessage("Deal.")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
					addCommsReply("2500 Rep.",function()
						setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
						uranusstation1:setFaction("Terranische Navy")
						pirchance = pirchance + 2
					end)
				end)
				addCommsReply("2000 Rep. und die Station geh�rt der TN.",function()
					setCommsMessage("Deal.")
					uranusstation1:setFaction("Terranische Navy")
					pirchance = pirchance + 3
				end)
				addCommsReply("2500 Rep. und die Station geh�rt der TN.",function()
					setCommsMessage("Wir h�tten das Schrottteil auch f�r 2000 Rep. hergegeben! Haha!")
					uranusstation1:setFaction("Terranische Navy")
					pirchance = pirchance + 3
				end)
			end)
		end
	end
	
	if pircom == 5 then -- M�glichkeit wieder TN zu werden --
		setCommsMessage([[Station Tortuga hier,
		
Frequenz und Schiffs ID erkannt, wie k�nnen wir ihnen helfen?]])
		 addCommsReply("Jagt Beendet.", function()
			if	player:areEnemiesInRange(5000) == false then
				player:setCallSign(PSHIPNAME):setFaction("Terranische Navy")
				setCommsMessage("Verstanden. Ende.")
				player:removeCustom("pir_att")
				player:removeCustom("pir_sh_on")
				player:removeCustom("pir_no_tar")
				player:removeCustom("pir_att_pos")
				pircom = 4
			else
				setCommsMessage("Es sind Schiffe in ihrer n�he. Versuchen sie es sp�ter noch einmal.")
			end
		 end)
	end

end

function brocken_comms()
	if brocken_stat == nil then
		setCommsMessage([[Seien sie gegr��t auf dem "Brocken".

Was k�nnen wir f�r sie tun?]])
		if brocken_kauf == 1 then
			addCommsReply("Wir w�rden gern den Brocken erwerben.", function()
				setCommsMessage("Wir sind eine hoch rentable Station, wir sind DIE anlauf Stelle f�r Erz- und Eis-Frachter.")
				addCommsReply("250 Rep.?", function()
					setCommsMessage("Das ist eine tiefe Beleidigung! Noch so ein Angebot und der Deal ist entg�ltig Gestorben!")
					addCommsReply("500 Rep.?",function()
					brocken_stat = 2
						if player:getReputationPoints() >= 500 then
							setCommsMessage("Deal!")
							asteroidenstation1:setFaction("Mars Tech Union")
							brocken_kauf = nil
							forderungen_count_mars = forderungen_count_mars + 1
						else
							setCommsMessage("Sie haben nicht genug Reputation.")
						end
					end)
					addCommsReply("1000 Rep.?", function()
						brocken_stat = 3
						if player:getReputationPoints() >= 1000 then
							setCommsMessage("Deal!")
							asteroidenstation1:setFaction("Mars Tech Union")
							brocken_kauf = nil
							forderungen_count_mars = forderungen_count_mars + 1
						else
							setCommsMessage("Sie haben nicht genug Reputation.")
						end
					end)
					addCommsReply("1500 Rep.?", function()
						brocken_stat = 4
						if player:getReputationPoints() >= 1500 then
							setCommsMessage("Deal!")
							asteroidenstation1:setFaction("Mars Tech Union")
							brocken_kauf = nil
							forderungen_count_mars = forderungen_count_mars + 1
						else
							setCommsMessage("Sie haben nicht genug Reputation.")
						end
					end)
				end)
				addCommsReply("500 Rep.?", function()
					brocken_kauf = 2
					if player:getReputationPoints() >= 500 then
						setCommsMessage("Deal!")
						asteroidenstation1:setFaction("Mars Tech Union")
						brocken_kauf = nil
						forderungen_count_mars = forderungen_count_mars + 1
					else
						setCommsMessage("Sie haben nicht genug Reputation.")
					end
				end)
				addCommsReply("1000 Rep.?", function()
					brocken_kauf = 3
					if player:getReputationPoints() >= 1000 then
						setCommsMessage("Deal!")
						asteroidenstation1:setFaction("Mars Tech Union")
						brocken_kauf = nil
						forderungen_count_mars = forderungen_count_mars + 1
					else
						setCommsMessage("Sie haben nicht genug Reputation.")
					end
				end)
				addCommsReply("1500 Rep.?", function()
					brocken_kauf = 4
					if player:getReputationPoints() >= 1500 then
						setCommsMessage("Deal!")
						asteroidenstation1:setFaction("Mars Tech Union")
						brocken_kauf = nil
						forderungen_count_mars = forderungen_count_mars + 1
					else
						setCommsMessage("Sie haben nicht genug Reputation.")
					end
				end)
			end)
		end
	end

	if brocken_kauf == 2 then
		setCommsMessage("Wo sind die 500 Rep.?")
		if player:getReputationPoints() >= 500 then
			setCommsMessage("Danke!")
			asteroidenstation1:setFaction("Mars Tech Union")
			brocken_kauf = nil
			forderungen_count_mars = forderungen_count_mars + 1
		else
			setCommsMessage("Sie haben nicht genug Reputation.")
		end
	end
	
	if brocken_kauf == 3 then
		setCommsMessage("Wo sind die 1000 Rep.?")
		if player:getReputationPoints() >= 1000 then
			setCommsMessage("Danke!")
			asteroidenstation1:setFaction("Mars Tech Union")
			brocken_kauf = nil
			forderungen_count_mars = forderungen_count_mars + 1
		else
			setCommsMessage("Sie haben nicht genug Reputation.")
		end
	end
	
	if brocken_kauf == 4 then
		setCommsMessage("Wo sind die 1500 Rep.?")
		if player:getReputationPoints() >= 1500 then
			setCommsMessage("Danke!")
			asteroidenstation1:setFaction("Mars Tech Union")
			brocken_kauf = nil
			forderungen_count_mars = forderungen_count_mars + 1
		else
			setCommsMessage("Sie haben nicht genug Reputation.")
		end
	end
end
 
 function UH_Anruf()
 venusstation1:openCommsTo(player)
 end
 
 function UH_entscheidung()
UH_Check = nil
	setCommsMessage([[Sie haben uns so viele gefallen getan ]].. PSHIPNAME ..[[ das wir nun ihnen einen Gefallen tun m�chten. Welche Partei soll eine Handelspriorit�t erhalten? NT oder MTU? Wir bieten es ihnen nur dieses eine mal an.]])
	addCommsReply("Terranische Navy",function()
		forderungen_count_terra = forderungen_count_terra + 1
		setCommsMessage("Erledigt.")
		venusstation1:setCommsScript("comms_station.lua")
	end)
	addCommsReply("Mars Tech Union",function()
		forderungen_count_mars = forderungen_count_mars + 1
		setCommsMessage("Erledigt")
		venusstation1:setCommsScript("comms_station.lua")
	end)
 end
 
 function Schiffs_Detail_Scan()
 -- Details �ber die Handelsschiffe.
	if Transport_1.Gescannt == 0 and Transport_1:isScannedByFaction("Terranische Navy") then
		Transport_1:setDescription("Lebenszeichen:\n1 Mensch \n2 Katzen \nKapit�n Haviland Tuf, der Besitzer dieses Schiffs, ihr name ist -F�llhorn der excellenten G�ter und niedrigen Preise-, ein gutm�tiger und stehts freundlicher H�ndler. Jedoch sollte man ihn nicht untersch�tzen und er mag Katzen.")
		Transport_1:setCallSign("UH F�llhorn der excellenten G�ter und niedriger Preise")
	Transport_1.Gescannt = 1
	end
	if Transport_2.Gescannt == 0 and Transport_2:isScannedByFaction("Terranische Navy") then
		Transport_2:setDescription("Lebenszeichen:\n5 Menschen \n1 Maus \nKapit�n Perry Rhodan, ehemaliger Major der Terranischen Navy. Angeblich sei er 340 Jahre alt, das behaupten zumindest einge Bewohner der Jupiterstation.")
		Transport_2:setCallSign("UH Stardust")
	Transport_2.Gescannt = 1
	end
	if Transport_3.Gescannt == 0 and Transport_3:isScannedByFaction("Terranische Navy") then
		Transport_3:setDescription("Lebenszeichen:\n1 Mensch \nKapit�n Gaius Baltar, fr�herer hochrangiger Politiker. Nach einem tiefen sozialen absturz schl�gt er sich nun als Kraftstoff-Transporter durch. Das Schiff ist jedoch mit der besten Technologie von Mars und Erde ausgestattet.")
		Transport_3:setCallSign("UH Zylon-Six")
	Transport_3.Gescannt = 1
	end
	if Transport_4.Gescannt == 0 and Transport_4:isScannedByFaction("Terranische Navy") then
		Transport_4:setDescription("#lp�okas� l�kmasm 0i88-,..-.,l ijdsac..,-.94&kmdas�c))0p0lmc�ams..-.c,�=! \n \n --- Alle Daten werden durch die Strahlung zerst�ckelt, selbst der Schiffsname scheint zersetzt zu werden bei der �bertragung. ---")
		Transport_4:setCallSign("Piranha")
		Transport_4:setFaction("Piraten")
		Transport_4:setBeamWeapon(0, 46, 0, 1000, 5, 15):setBeamWeapon(1, 46, -180, 1000, 5, 15):setShields(100, 100)
		Transport_4:orderDock(uranusstation1)
	Transport_4.Gescannt = 1
	end
	if Transport_5.Gescannt == 0 and Transport_5:isScannedByFaction("Terranische Navy") then
		Transport_5:setDescription("Lebenszeichen:\n4 Menschen \nKapit�n: L.Arvus \nErster Offizier: P.Peterson \nTechniker: S.Michalowitzch \nPassagier: E.Watson \n Ladung: 50 Tonnen Wissenschaftliches Equipment.")
		Transport_5:setCallSign("UH Pyrox")
		player:addCustomMessage("science","p_dax",[[Gesuchte Person entdeckt.
		
Bis auf 3U an das Schiff heranfliegen um Person festzunehmen.
(Fenster nicht Schlie�en!)]])
		wissens_activ = 1
		wissenschaftler = Transport_5
	Transport_5.Gescannt = 1
	end
	if Transport_6.Gescannt == 0 and Transport_6:isScannedByFaction("Terranische Navy") then
		Transport_6:setDescription("Lebenszeichen:\n54 Menschen \nKapit�n: W.Cheng \nErster Offizier: T.Long \nTechniker: S.M�ller \n Arzt: D.Smith \nPassagier01: L.Worlas \nPassagier02: K.Limbert \nPassagier03: U.Sambert \nPassagier04: E.Plater \nPassagier05: K.Friedrich \nPassagier06: F.Disch \nPassagier07: G.Weiter \nWeitere Namen werden geladen...")
		Transport_6:setCallSign("UH Arizona")
	Transport_6.Gescannt = 1
	end
	if Transport_7.Gescannt == 0 and Transport_7:isScannedByFaction("Terranische Navy") then
		Transport_7:setDescription("Lebenszeichen:\n2 Menschen \nKapit�n: J.Sluk \nTechniker: L.Tuang \n\nLadung: \nDatapads, Stations Eqipment, Handfeuerwaffen.")
		Transport_7:setCallSign("UH Sparrow")
	Transport_7.Gescannt = 1
	end
	if Transport_8.Gescannt == 0 and Transport_8:isScannedByFaction("Terranische Navy") then
		Transport_8:setDescription("Lebenszeichen:\n4 Menschen \nKapit�n: A.Coblenz\nErster Offizier: E.Ripley\n\nLadung: \nVersuchstiere und einige G�ter des t�glichen Bedarfs.")
		Transport_8:setCallSign("UH Nostromo")
		player:addCustomMessage("science","p_dax",[[Gesuchte Person entdeckt.
		
Bis auf 3U an das Schiff heranfliegen um Person festzunehmen.
(Fenster nicht Schlie�en!)]])
		wissens_activ = 1
		wissenschaftler = Transport_8
		Transport_8.Gescannt = 1
	end
	if Transport_9.Gescannt == 0 and Transport_9:isScannedByFaction("Terranische Navy") then
		Transport_9:setDescription("Lebenszeichen:\n3 Menschen \nKapit�n: C.Davis\nErster Offizier: L.Harper\nTechnicker: P.Carter\n\nLadung: \nKeine")
		Transport_9:setCallSign("UH Lepovnik")
	Transport_9.Gescannt = 1
	end
	if Transport_10.Gescannt == 0 and Transport_10:isScannedByFaction("Terranische Navy") then
		Transport_10:setDescription("Lebenszeichen:\n22 Menschen \nKapit�n: J.Jordan \nErster Offizier: P.Rassa \nPassagier01: A.Cusher \nPassagier02: A.Bliss \nPassagier03: F.Susaru \nPassagier04: M.Jarson \nPassagier05: P.Dax \nPassagier06: R.Furk \nPassagier07: V.Worklovski \nWeitere Namen werden geladen...")
		Transport_10:setCallSign("UH Kolonial")
		player:addCustomMessage("science","p_dax",[[Gesuchte Person entdeckt.
		
Bis auf 3U an das Schiff heranfliegen um Person festzunehmen.
(Fenster nicht Schlie�en!)]])
		wissens_activ = 1
		wissenschaftler = Transport_10
		dax_da = 1
		Transport_10.Gescannt = 1
	end
	if Transport_11.Gescannt == 0 and Transport_11:isScannedByFaction("Terranische Navy") then
		Transport_11:setDescription("Lebenszeichen:\n5 Menschen \nKapit�n: S.Jates \nDer Erzsch�rfer weist enorme kratzer und dellen auf die darauf hindeuten, dass das Schiff nicht den besten Steuermann vorzuweisen hat. \n\nLadung: \nEisen: 10 Tonnen\nNickel: 5 Tonnen")
		Transport_11:setCallSign("UH Lurch")
	Transport_11.Gescannt = 1
	end
	if Transport_12.Gescannt == 0 and Transport_12:isScannedByFaction("Terranische Navy") then
		Transport_12:setDescription("Lebenszeichen:\n5 Menschen \nKapit�n: P.Irwin \nErster Offizier: L.Killarny \nTechnicker: F.Agila\n\nLadung: \nEis: 28 Tonnen")
		Transport_12:setCallSign("UH Pastor")
	Transport_12.Gescannt = 1
	end
	if Transport_13.Gescannt == 0 and Transport_13:isScannedByFaction("Terranische Navy") then
		Transport_13:setDescription("Lebenszeichen:\n5 Menschen \nKapit�n: T.Wheeler \nTechnicker: A.Palpavisch\n\nLadung: \nBlei: 40 Tonnen \n\n\nWas immer ihr �ber Kapit�n Theodor Wheeler geh�rt habt, er hat nie einen Au�erirdischen getroffen. Marsianer ausgeschlossen.")
		Transport_13:setCallSign("UH Europa")
		player:addCustomMessage("science","p_dax",[[Gesuchte Person entdeckt.
		
Bis auf 3U an das Schiff heranfliegen um Person festzunehmen.
(Fenster nicht Schlie�en!)]])
		wissens_activ = 1
		wissenschaftler = Transport_13
	Transport_13.Gescannt = 1
	end
-- Ende Details �ber die Handelsschiffe.
 end
 
 function Planeten_Detail_Scan()
 -- Details �ber Planeten
	if sun2.Gescannt == 0 and sun2:isScannedByFaction("Terranische Navy") then
		sun2:setDescription("Stern: Sol\n\n\nScannwerte: \n\nZusammensetzung: \nWasserstoff: 92,1%\nHelium: 7,8%\nSauerstoff, Kohlenstoff, Neon, Stickstoff: 1%")
	sun2.Gescannt = 1
	end
	if merkur2.Gescannt == 0 and merkur2:isScannedByFaction("Terranische Navy") then
		merkur2:setDescription("Planet: Merkur\n\n\nScannwerte: \n\nAtmospheren Hauptbestandteile: bei 1 � 10^-15\nWasserstoff 22%\nHelium: 6%\nSauerstoff: 42%\nNatrium: 29%\nKalium: 0,5%\n\n Zusammensetzung: \nEisen: 65%\nNickel: 30%\nSonstige: 5%")
	merkur2.Gescannt = 1
	merkur2.TuffDaten = 2
	end
	if venus2.Gescannt == 0 and venus2:isScannedByFaction("Terranische Navy") then
		venus2:setDescription("Planet: Venus\n\n\nScannwerte: \n\nAtmospheren Hauptbestandteile: bei 92 kPa\nKohlenstoffdioxid: 96,5%\nStickstoff: 3,5%\nSchwefeldioxid: 0,015%\n\n Zusammensetzung:\nEisen: 22,5% \nSauerstoff: 29,7% \nSilizium: 18,1% \nMagnesium: 10,9% \nSchwefel: 3,9% \nNickel: 0,7% \nCalcium: 1,5% \nAluminium: 11,4% \nSonstige Elemente: 1,2%")
	venus2.Gescannt = 1
	venus2.TuffDaten = 2
	end
	if earth2.Gescannt == 0 and earth2:isScannedByFaction("Terranische Navy") then
		earth2:setDescription("Planet: Terra \n\nBewohner: 11.002.429.983\n\nBodentruppen: Keine Daten \n\n\nScannwerte: \n\nAtmospheren Hauptbestandteile: bei 1013 hPa \nStickstoff: 78,08% \nSauerstoff: 20,95% \nArgon: 0,93% \nKholenstoffdioxid: 0,038% \nNeon: 0,002% \n\n Zusammensetzung:\nEisen: 32,1% \nSauerstoff: 30,1% \nSilizium: 15,1% \nMagnesium: 13,9% \nSchwefel: 2,9% \nNickel: 1,8% \nCalcium: 1,5% \nAluminium: 1,4% \nSonstige Elemente: 1,2%")
	earth2.Gescannt = 1
	earth2.TuffDaten = 2
	end
	if moon2.Gescannt == 0 and moon2:isScannedByFaction("Terranische Navy") then
		moon2:setDescription("Satellit: Mond \n\nBewohner: 1.302.894\n\nBodentruppen: Keine Daten \n\n\nScannwerte: \n\nAtmospheren Hauptbestandteile: bei 3 � 10^-10 \nHelium: 25% \nNeon: 25% \nWasserstoff: 23% \nArgon: 20% \nCH4, NH3, CO2: 7% \n\n Zusammensetzung: \nSilizium: 45,5% \nAluminium: 24% \nCalcium: 15,9% \nEisen: 5,9% \nMagnesium: 7,5% \nTitan: 0,6% \nNatrium: 0,6% \nKalium: <0,1% \n\nZudem gibt es konzentrierte Vorkommen von Uran und Thorium.")
	moon2.Gescannt = 1
	end
	if mars2.Gescannt == 0 and earth2:isScannedByFaction("Terranische Navy") then
		mars2:setDescription("Planet: Mars \n\nBewohner: 4.042.246.934\n\nBodentruppen: Keine Daten \n\n\nScannwerte: \n\nAtmospheren Hauptbestandteile: bei 6,36 hPa \nKohlenstoffdioxid: 95,3%\nStickstoff: 2,7%\nArgon: 1,6% \n\n Zusammensetzung:\nEisen: 42% \nSauerstoff: 15,3% \nSilizium: 10,1% \nMagnesium: 18,9% \nSchwefel: 7,9% \nNickel: 1,8% \nCalcium: 1,9% \nAluminium: 1% \nSonstige Elemente: 1,2%")
	mars2.Gescannt = 1
	mars2.TuffDaten = 2
	end
	if jupiter2.Gescannt == 0 and jupiter2:isScannedByFaction("Terranische Navy") then
		jupiter2:setDescription("Planet: Jupiter\n\n\nScannwerte: \n\nAtmospheren Hauptbestandteile: bei 1 kPa\nWasserstoff: 89,8%\nHelium: 10,2%\nMethan: 0,3%\nAmmoniak: 0,026%")
	jupiter2.Gescannt = 1
	jupiter2.TuffDaten = 2
	end
	if saturn2.Gescannt == 0 and saturn2:isScannedByFaction("Terranische Navy") then
		saturn2:setDescription("Planet: Saturn\n\n\nScannwerte: \n\nAtmospheren Hauptbestandteile: bei 1 kPa\nWasserstoff: 96,3%\nHelium: 3,25%\nMethan: 0,45%\nAmmoniak: 0,026%")
	saturn2.Gescannt = 1
	saturn2.TuffDaten = 2
	end
	if uranus2.Gescannt == 0 and uranus2:isScannedByFaction("Terranische Navy") then
		uranus2:setDescription("Planet: Uranus\n\n\nScannwerte: \n\nAtmospheren Hauptbestandteile: bei 1 kPa\nWasserstoff: 82,5%\nHelium: 15,2%\nMethan: 2,3%")
	uranus2.Gescannt = 1
	uranus2.TuffDaten = 2
	end
	if neptun2.Gescannt == 0 and neptun2:isScannedByFaction("Terranische Navy") then
		neptun2:setDescription("Planet: Neptun\n\n\nScannwerte: \n\nAtmospheren Hauptbestandteile: bei 1 kPa\nWasserstoff: 80% \nHelium: 19%\nMethan: 1%")
	neptun2.Gescannt = 1
	neptun2.TuffDaten = 2
	end
	if pluto2.Gescannt == 0 and pluto2:isScannedByFaction("Terranische Navy") then
		pluto2:setDescription("Planet: Pluto\n\n\nScannwerte: \n\nAtmospheren Hauptbestandteile: bei 3 � 10^-6\nStickstoff: 34%\nKohlenmonoxid: 33%\nMethan: 33% \n\nZusammensetzung:\nStickstoff: 10%\nWassereis: 30%\nGestein: 55%\nUran: 5%")
	pluto2.Gescannt = 1
	pluto2.TuffDaten = 2
	end
-- Ende Details �ber Planeten
 end
 
 function mining()
	local stationMine = Station:enrich(asteroidenstation1)
		Station:withStorageRooms(stationMine, {
			[products.ore] = 1000,
		})
		stationMine:modifyProductStorage(products.ore, 200)
		Station:withProduction(stationMine, {
			{
				productionTime = 5,
					consumes = {
					{ product = products.ore, amount = 1 },
				}
			},
		})
		local minerShip = Ship:enrich(Transport_13)
		Util.spawnAtStation(stationMine, minerShip)
		Ship:withStorageRooms(minerShip, {
			[products.ore] = 250,
		})
		Ship:orderMiner(minerShip, stationMine, function(asteroid, ship, station)
		local resources = {
			[products.ore] = math.random(10, 50)
		}
		return resources
	end)
end
 
function update (delta)

	Cron.tick(delta)
	-- Keine Ahnung warum das notwendig ist, MissionsStatus--
    --if mission_state ~= nil then
    --    mission_state(delta)
    --end
	-- Ende MissionsStatus--
	
	if mission_state == 0 then
	missionStartState()
	end
	
	if ER_10_8_A == 1 and Transport_8:isValid() == false and ER_10_8 == 3 then
	ER_10_8_A = nil
	UH_Check = UH_Check + 1
	end
	
	if UH_Check == 5 then
		UH_Anruf()
		venusstation1:setCommsFunction(UH_entscheidung)
	end
	
	-- Aktion bei Wissenschaftler fund --
	if wissens_activ == 1 then 
		wissens_fang()
		wissens_activ = 2
	end
	
	-- Wissenschafts Counter --
	if wissens_count == nil then
        wissens_count = 0
    end
	
	-- Aktion wenn 3 Wissenschaftler gez�hlt worden sind --
	if wissens_count == 3 then
		mission_state = 4
		missionStartState()
		wissens_count = 0
	end
	
	-- Escort der TN Albatross --
	if distance(player,tn_01) < 2000 and escort_tna == 1 then
		tn_01:orderFlyTowards(111500,-14000)
		mtu_01:orderFlyTowards(111600,-14000)
		escort_tna = 2
		player:addCustomMessage("relay","escot_comm1","Folgen sie uns und k�mmern sie sich um jedwede Gefahr die sich uns entgegen stellt.")
	end
	
	-- Freigabe f�r Unterzeichnungen --
	if escort_tna == 2 and distance(tn_01,mtu_01) < 1000 then
		player:addCustomMessage("relay","escot_comm2",[[Schon auf dem Weg konnten sich die Diplomaten auf die letzten Einzelheiten einigen.
		
Man hat zudem entschieden das Sie, der Kapit�n der ]].. PSHIPNAME ..[[, und jeder Offizier der Br�ckencrew, der am Unternehmen beteiligt war, den Mars-Kontrakt ebenfalls unterzeichnen sollte.]])
		player:addCustomButton("relay","unterz_crew00", "Unterzeichnung freigeben", function()
			player:removeCustom("escot_comm2")
			player:removeCustom("unterz_crew00")
			escort_tna = 3
		end)
	end
	
	-- Die Ehre das jedes Br�ckencrew Mitglied das Mars-Kontrakt unterzeichnen darf --
	if escort_tna == 3 and distance(tn_01,mtu_01) < 1000 then
		escort_tna = nil
		player:addCustomButton("relay","unterz_crew01", "Unterzeichnen RELAY", function()
			unterzcrew = unterzcrew + 1
			player:removeCustom("unterz_crew01")
		end)
		player:addCustomButton("science","unterz_crew02", "Unterzeichnen SCIENCE", function()
			unterzcrew = unterzcrew + 1
			player:removeCustom("unterz_crew02")
		end)
		player:addCustomButton("engineering","unterz_crew03", "Unterzeichnen ENGINEERING", function()
			unterzcrew = unterzcrew + 1
			player:removeCustom("unterz_crew03")
		end)
		player:addCustomButton("weapons","unterz_crew04", "Unterzeichnen WEAPONS", function()
			unterzcrew = unterzcrew + 1
			player:removeCustom("unterz_crew04")
		end)
		player:addCustomButton("helms","unterz_crew05", "Unterzeichnen HELMS", function()
			unterzcrew = unterzcrew + 1
			player:removeCustom("unterz_crew05")
		end)
		player:addCustomButton("engineering","unterz_crew06", "Unterzeichnen KAPIT�N", function()
			unterzcrew = unterzcrew + 1
			player:removeCustom("unterz_crew06")
			player:removeCustom("unterz_crew07")
			player:removeCustom("unterz_crew08")
			player:removeCustom("unterz_crew09")
			player:removeCustom("unterz_crew10")
		end)
		player:addCustomButton("relay","unterz_crew07", "Unterzeichnen KAPIT�N", function()
			unterzcrew = unterzcrew + 1
			player:removeCustom("unterz_crew06")
			player:removeCustom("unterz_crew07")
			player:removeCustom("unterz_crew08")
			player:removeCustom("unterz_crew09")
			player:removeCustom("unterz_crew10")
		end)
		player:addCustomButton("science","unterz_crew08", "Unterzeichnen KAPIT�N", function()
			unterzcrew = unterzcrew + 1
			player:removeCustom("unterz_crew06")
			player:removeCustom("unterz_crew07")
			player:removeCustom("unterz_crew08")
			player:removeCustom("unterz_crew09")
			player:removeCustom("unterz_crew10")
		end)
		player:addCustomButton("helms","unterz_crew09", "Unterzeichnen KAPIT�N", function()
			unterzcrew = unterzcrew + 1
			player:removeCustom("unterz_crew06")
			player:removeCustom("unterz_crew07")
			player:removeCustom("unterz_crew08")
			player:removeCustom("unterz_crew09")
			player:removeCustom("unterz_crew10")
		end)
		player:addCustomButton("weapons","unterz_crew10", "Unterzeichnen KAPIT�N", function()
			unterzcrew = unterzcrew + 1
			player:removeCustom("unterz_crew06")
			player:removeCustom("unterz_crew07")
			player:removeCustom("unterz_crew08")
			player:removeCustom("unterz_crew09")
			player:removeCustom("unterz_crew10")
		end)
	end
	
	-- Counter Unterschriften der Crew --
	if unterzcrew == nil then
        unterzcrew = 0
    end
	
	-- TN Mission gewonnen --
	if unterzcrew == 6 then
		marsstation1:setFaction("Terranische Navy")
		mtu_01:setFaction("Terranische Navy")
		mtu_02:setFaction("Terranische Navy")
		mtu_03:setFaction("Terranische Navy")
		mtu_04:setFaction("Terranische Navy")
		mtu_05:setFaction("Terranische Navy")
		mtu_06:setFaction("Terranische Navy")
		mtu_07:setFaction("Terranische Navy")
		mtu_08:setFaction("Terranische Navy")
		globalMessage([[Der Mars-Kontrakt wurde unterzeichnet. 
Sie haben ihre Mission erf�llt TN Vidandi. Gratulation!

Von nun an k�nnen sie das restliche Sol-System erforschen...
Oder die grenzen dar�ber hinaus...]]) -- muss noch ins Logbuch irgendwie.
	unterzcrew = 0
	end
	
	-- Counter f�r erf�llte Forderungen der MTU --
	if forderungen_count_mars == nil then
        forderungen_count_mars = 0
    end
	
	-- Counter f�r erf�llte Forderungen der TN --
	if forderungen_count_terra == nil then
        forderungen_count_terra = 0
    end
	
	-- Pr�fung ob jeweils 3 der Forderungen erf�llt wurden --
	if forderung_count_mars == 3 and forderung_count_terra == 3 then
		forderungen_count_terra = nil
		forderungen_count_mars = nil
		missionStartState()
		mission_state = 5
	end
	
-- Piraten Check Forderung --
	if pir == 1 and pirat_01:getFaction() ~= "Piraten" or pirat_01:isValid() ~= true and pirat_02:getFaction() ~= "Piraten" or pirat_02:isValid() ~= true and pirat_03:getFaction() ~= "Piraten" or pirat_03:isValid() ~= true and pirat_04:getFaction() ~= "Piraten" or pirat_04:isValid() ~= true and pirat_05:getFaction() ~= "Piraten" or pirat_05:isValid() ~= true and pirat_06:getFaction() ~= "Piraten" or pirat_06:isValid() ~= true and pirat_07:getFaction() ~= "Piraten" or pirat_07:isValid() ~= true and pirat_08:getFaction() ~= "Piraten" or pirat_08:isValid() ~= true and pirat_09:getFaction() ~= "Piraten" or pirat_09:isValid() ~= true and pirat_10:getFaction() ~= "Piraten" or pirat_10:isValid() ~= true and uranusstation1:getFaction() ~= "Piraten" or uranusstation1:isValid() ~= true and Transport_4:getFaction() ~= "Piraten" or Transport_4:isValid() ~= true then
		forderungen_count_mars = forderungen_count_mars + 1
		forderungen_count_terra = forderungen_count_terra + 1
		pir = nil
	end
-- Ende Piraten Check Forderung --

-- Piraten Check Forderung --
	if pir2 == 1 and pirat_01:getFaction() == "Piraten (Alliierte)" or pirat_01:isValid() ~= true and pirat_02:getFaction() == "Piraten (Alliierte)" or pirat_02:isValid() ~= true and pirat_03:getFaction() == "Piraten (Alliierte)" or pirat_03:isValid() ~= true and pirat_04:getFaction() == "Piraten (Alliierte)" or pirat_04:isValid() ~= true and pirat_05:getFaction() == "Piraten (Alliierte)" or pirat_05:isValid() ~= true and pirat_06:getFaction() == "Piraten (Alliierte)" or pirat_06:isValid() ~= true and pirat_07:getFaction() == "Piraten (Alliierte)" or pirat_07:isValid() ~= true and pirat_08:getFaction() == "Piraten (Alliierte)" or pirat_08:isValid() ~= true and pirat_09:getFaction() == "Piraten" or pirat_09:isValid() ~= true and pirat_10:getFaction() == "Piraten (Alliierte)" or pirat_10:isValid() ~= true and uranusstation1:getFaction() == "Piraten (Alliierte)" or uranusstation1:isValid() ~= true and Transport_4:getFaction() ~= "Piraten (Alliierte)" or Transport_4:isValid() ~= true then
		forderungen_count_terra = forderungen_count_terra + 1
		pir2 = nil
	end
-- Ende Piraten Check Forderung --
	
-- Piraten zu Alliierten machen --
	if pir3 == 1 and pirat_10:getHull() < 50 then
		player:addCustomMessage("relay","piratenaufgabe",[[Hier spricht Admiral Ackbar!

Genug! Wir haben GENUG! Wir geben auf und werden uns ihrem Willen beugen. Die Piratenflotte steht zu ihrer Verf�gung,...]])
		marsstation1:setFaction("Piraten (Alliierte)")
		pirat_01:setFaction("Piraten (Alliierte)")
		pirat_02:setFaction("Piraten (Alliierte)")
		pirat_03:setFaction("Piraten (Alliierte)")
		pirat_04:setFaction("Piraten (Alliierte)")
		pirat_05:setFaction("Piraten (Alliierte)")
		pirat_06:setFaction("Piraten (Alliierte)")
		pirat_07:setFaction("Piraten (Alliierte)")
		pirat_08:setFaction("Piraten (Alliierte)")
		pirat_09:setFaction("Piraten (Alliierte)")
		pirat_10:setFaction("Piraten (Alliierte)")
		pircom = 4
		pir3 = nil
	elseif pir3 == 1 and pircred >= 100 then
		player:addCustomMessage("relay","piratenaufgabe2",[[Hier spricht Admiral Ackbar!

Wir sind beeindruckt von ihrer Karperfahrt. Sollten sie jemals unsere Unterst�tzung ben�tigen geben sie bescheid!]])
		marsstation1:setFaction("Piraten (Alliierte)")
		pirat_01:setFaction("Piraten (Alliierte)")
		pirat_02:setFaction("Piraten (Alliierte)")
		pirat_03:setFaction("Piraten (Alliierte)")
		pirat_04:setFaction("Piraten (Alliierte)")
		pirat_05:setFaction("Piraten (Alliierte)")
		pirat_06:setFaction("Piraten (Alliierte)")
		pirat_07:setFaction("Piraten (Alliierte)")
		pirat_08:setFaction("Piraten (Alliierte)")
		pirat_09:setFaction("Piraten (Alliierte)")
		pirat_10:setFaction("Piraten (Alliierte)")
		pircom = 4
		pir3 = nil
	end
-- Ende Piraten zu Alliierten machen --

-- Piraten beeindrucken und Unabh�ngige H�ndler berauben --
	if player:getFaction() == "Piraten" or player:getFaction() == "Piraten (Alliierte)" then
		player:addCustomButton("weapons", "pir_att", "Berauben", function()
			tar_dummy = player:getTarget()
			if tar_dummy:getFaction() == "Unabh�ngige" and tar_dummy:getFrontShield() <= 0 or tar_dummy:getRearShield() <= 0 then
				player:removeCustom("pir_sh_on")
				player:removeCustom("pir_no_tar")
				tar_dummy:setFaction("Unabh�ngige.")
				player:addCustomInfo("weapons", "pir_att_pos", "Schiff beraubt")
				player:addReputationPoints(100)
				pircred = pircred + 20
				tar_dummy = 0
			elseif tar_dummy == nil then
				player:addCustomInfo("weapons", "pir_no_tar", "Kein Ziel")
				player:removeCustom("pir_sh_on")
				player:removeCustom("pir_att_pos")
				tar_dummy = 0
			elseif tar_dummy:getFaction() == "Unabh�ngige" and tar_dummy:getFrontShield() > 0 and tar_dummy:getRearShield() > 0 then
				player:addCustomInfo("weapons", "pir_sh_on", "Schilde des Ziels noch Aktiv")
				player:removeCustom("pir_no_tar")
				player:removeCustom("pir_att_pos")
				tar_dummy = 0
			elseif tar_dummy:getFaction() ~= "Unabh�ngige" and tar_dummy ~= nil then
				player:addCustomInfo("weapons", "pir_no_tar", "Kein Waren an Bord.")
				player:removeCustom("pir_sh_on")
				player:removeCustom("pir_att_pos")
				tar_dummy = 0
			end
		end)
	end
-- Ende Piraten beeindrucken und Unabh�ngige H�ndler berauben --

-- Eroberung Uranus Station f�r TN --
	if uranusstation1:getFaction() == "Terranische Navy" and uranusstation1:isValid() == true and terur == 1 then
		forderungen_count_terra = forderungen_count_terra + 1
		terur = nil
	end

	Schiffs_Detail_Scan()

	Planeten_Detail_Scan()

-- Alienschiff --
	if alien_01.Gescannt == 0 and alien_01:isScannedByFaction("Terranische Navy") then
		alien_01:setCallSign("Shapiron")
		alien_state = 1
		alien_01:openCommsTo(player)
		alien_01.Gescannt = 1
	end
-- Ende Alienschiff--

	coolentdecisiontaker()
	-- Tarnnebelvernichtung --
	if coolant_lvl == 3 then
		if timer_neb1 == nil then timer_neb1 = 0 end
	elseif coolant_lvl == 6 then
			if timer_neb2 == nil then timer_neb2 = 0 end
	elseif coolant_lvl == 9 then
			if timer_neb3 == nil then timer_neb3 = 0 end
	end
	if timer_neb1 ~= nil then
		timer_neb1 = timer_neb1 + delta
		if timer_neb1 > 10 then
			neb1:destroy()
			timer_neb1 = nil
		end
	end
	if timer_neb2 ~= nil then
		timer_neb2 = timer_neb2 + delta
		if timer_neb2 > 10 then
			neb2:destroy()
			timer_neb2 = nil
		end
	end
	if timer_neb3 ~= nil then
		timer_neb3 = timer_neb3 + delta
		if timer_neb3 > 10 then
			neb3:destroy()
			timer_neb3 = nil
		end
	end
	-- Ende Tarnnebelvernichtung --
	kuehlmittelaufnahme()
end
