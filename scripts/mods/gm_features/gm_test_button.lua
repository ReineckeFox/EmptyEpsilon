require("mods/map/sol_system_asteroids.lua")
require("mods/map/sol_system_planets.lua")
require("mods/map/asteroidbelt.lua")
require("mods/map/system_x.lua")
require("mods/map/asteroid_descriptions.lua")
require("mods/sidequests/Hinterhalt.lua")
require("mods/gm_features/celestialCleanup.lua")

local addedMenuButtons = {}

createMainMenu = function()
    addedGMFunction("Hauptmissionen", function()
        removeMenu()
        createMainMissionMenu()
        addedGMFunction("<--", function()
            removeMenu()
            createMainMenu()
        end)
    end)
    addedGMFunction("Nebenmissionen", function()
        removeMenu()
        createSystemXMenu()
        addedGMFunction("<--", function()
            removeMenu()
            createMainMenu()
        end)
    end)
    createCelestialBodyCleanup()
    addedGMFunction("<--", function()
        removeMenu()
        createMainMenu()
    end)
end

function addedGMFunction(name, func)
    addGMFunction(name, func)  -- Pass the function reference directly
    addedMenuButtons[name] = true
end

function removeMenu()
    for name, _ in pairs(addedMenuButtons) do
        removeGMFunction(name)
    end
end

createMainMissionMenu = function()
    addedGMFunction("Sol System", function()
        AddSolPlanets()
        createAsteroidBelt(120000, 0, 40000*2, 40000, 3000, 80)
        createAsteroidBelt(120000, 0, 55000*2, 30000, 200, 60)
        createAsteroidBelt(120000, 0, 27500*2, 7500, 50, 60)
        -- Saturn Belt Start
        createAsteroidBelt(13075, -185200, 7000, 500, 400, 40)
        createAsteroidBelt(13075, -185200, 9000, 1500, 1000, 40)
        createAsteroidBelt(13075, -185200, 11000, 500, 600, 40)
        -- Saturn Belt End
        removeMenu()
        createMainMenu()
    end)
end

createSystemXMenu = function()
    addedGMFunction("System X", function()
        removeMenu()
        addedGMFunction("Create System", function()
            systemX()
            systemXSetTrap()
            setAsteroidDescription()
            removeGMFunction("Create System")
        end)
        addedGMFunction("Activate Trap manually", function()
            replaceFakeAsteroidsWithCPUShips()
            removeGMFunction("Activate Trap manually")
        end)
        addedGMFunction("<--", function()
            removeMenu()
            createMainMenu()
        end)
    end)
end

createCelestialBodyCleanup = function()
    addedGMFunction("Cleanup", function()
        makeCleanup()
        removeMenu()
        createMainMenu()
    end)
end

function drawGraph(values)
    local graphOutput = ""

    for _, value in ipairs(values) do
        local bar = string.rep("*", value)
        graphOutput = graphOutput .. bar .. "\n"
    end

    return graphOutput
end