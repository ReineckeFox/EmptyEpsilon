collectPlayerShips = function()
    checkDestroyedPlayerShips()
    for _, obj in ipairs(getAllObjects()) do
        if obj.typeName == "PlayerSpaceship" and obj:isValid() then
            local isAlreadyAdded = false
            for _, pship in ipairs(playerShipList) do
                if obj == pship then
                    isAlreadyAdded = true
                    break
                end
            end
            if not isAlreadyAdded then
                table.insert(playerShipList, obj)
                addStealthTimerAndFlag(obj)
            end
        end
    end
end

checkDestroyedPlayerShips = function()
    local i = 1
    while i <= #playerShipList do
        if not playerShipList[i]:isValid() then
            table.remove(playerShipList, i)
        else
            i = i + 1
        end
    end
end

addStealthTimerAndFlag = function(pship)
    pship.silentFlag = 0
    pship.stealthTimer = 0
    pship.stealthZones = {}
    for _, system in ipairs({"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}) do
        pship:setSystemPower(system, 0.0) -- Diese beiden Zeilen setzen die "Leistung" der Systeme auf 0.0, Engineering muss quasi den Motor erstmal starten.
        pship:commandSetSystemPowerRequest(system, 0.0)
    end
end