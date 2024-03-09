-- Name: Erste Mission
-- Description: Eine Crew, eine Mission, ein unbekanntes Schicksal
-- Type: Basic

time = 0
stealthZoneTimer = 0
addedSilentRunningCustomInfos = {}
playerShipList = {}
timecalc = 0
function init()
    -- Load Mods & Scrips

    -- Environment Scripts
    print("TEST STARTS HERE!!! SHOW THIS SHIT!!!")
    require("mods/map/sol_system_asteroids.lua")
    require("mods/map/sol_system_planets.lua")
	require("mods/map/asteroidbelt.lua")
    require("mods/ship_features/silentrunning.lua")
	-- GM Scripts
	require("mods/gm_features/gm_test_button.lua")
    require("mods/tools/tool_db.lua")
    require("mods/tools/mp_playership_control.lua")
    --require("science_db.lua")
    --require("factionInfo.lua")
    db_erase()
	--WormHole():setPosition(39427, -60517):setTargetPosition(-126673, -192255):setRadarTrace("RadarBlip.png")
	player = PlayerSpaceship():setFaction("Human Navy"):setTemplate("Atlantis"):setPosition(80000, 0):setCallSign("TN Verdandi"):setShieldsMax(100.00, 100.00):setShields(100.00, 100.00):setHullMax(100):setHull(100):setLongRangeRadarRange(100000)
    for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}) do
        player:setSystemPower(system, 0.0) -- Diese beiden Zeilen setzen die "Leistung" der Systeme auf 0.0, Engineering muss quasi den Motor erstmal starten.
        player:commandSetSystemPowerRequest(system, 0.0)
        player:commandSetSystemPowerRequest("impulse", 0.5)
        player:commandSetSystemPowerRequest("maneuver", 0.25)
    end
    PlayerSpaceship():setFaction("Human Navy"):setTemplate("MP52 Hornet"):setPosition(81613, 7789)

    collectPlayerShips()
    CpuShip():setFaction("Kraylorf"):setTemplate("Adder MK3"):setCallSign("BR2"):setPosition(85110,-5478):setWeaponStorage("HVLI", 1):orderFlyTowardsBlind(85110,-5478)
    CpuShip():setFaction("Kraylor"):setTemplate("Adv. Gunship"):setCallSign("CV3"):setPosition(75921,5464):setWeaponStorage("Homing", 2):orderFlyTowardsBlind(75921,5464)
    CpuShip():setFaction("Independent"):setTemplate("Transport1x3"):setCallSign("BR4"):setPosition(82568,3155):orderRoaming():orderFlyTowardsBlind(82568,3155)


    --player:addCustomButton("Science","send_signal_btn_ops",_("send signal"),test0001)



    createMainMenu()
    --checkStuff()
    addGMFunction("DoStuff", function() setSilentFlag()  end)
    addGMFunction("Collect Ships", function() collectPlayerShips()  end)
    addGMFunction("test", function()
        for __, obj in pairs(playerShipList) do
            --addGMMessage(obj.typeName)
            obj:addCustomButton("Engineering","silent_running_engineer",_("Schleichfahrt"),function() setSilentFlag(obj) end)
        end
    end)

    --HVLI():setPosition(1000,1000):setTarget(player):setLifetime(30):setMissileSize("large")
    --HVLI():setPosition(1000,0):setTarget(player):setLifetime(30):setMissileSize("medium")
    --HVLI():setPosition(1000,-1000):setTarget(player):setLifetime(30):setMissileSize("small")
end

local functionList = {
    { interval = 1, timer = 0, func = checkDestroyedPlayerShips },
    -- Add more functions as needed
}

function update (delta)
	time = time + delta

    for _, pship in pairs(playerShipList) do
        if pship.silentFlag == 1 then
            calculateStealthZone(delta,pship)
        end
    end

    -- runs the functionList and will activate the specific Function whenever interval is reached.
    for _, funcInfo in ipairs(functionList) do
        funcInfo.timer = funcInfo.timer + delta
        if funcInfo.timer >= funcInfo.interval then
            funcInfo.func()
            funcInfo.timer = funcInfo.timer - funcInfo.interval
        end
    end
end