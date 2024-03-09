calculateStealthZone = function(timepassed,pship)
    pship.stealthTimer = pship.stealthTimer + timepassed
    if pship.stealthTimer >= 0.5 then
        for _, stealthz in ipairs(pship.stealthZones) do
            stealthz:destroy()
        end
        local sx,sy = pship:getPosition()
        local cSObjects = getObjectsInRadius(sx, sy, 30000)
        local systemNames = {"reactor", "beamweapons", "missilesystem", "maneuver", "impulse", "warp", "jumpdrive", "frontshield", "rearshield"}
        totalPower = 0
        for _, systemName in ipairs(systemNames) do
            if systemName == "reactor" then
                totalPower = totalPower + (pship:getSystemPowerFactor(systemName)*4.8*pship:getSystemPower(systemName)*-1)
            else
                totalPower = totalPower + (pship:getSystemPowerFactor(systemName)*4.8*pship:getSystemPower(systemName))
            end
        end
        local checkTotalPower = totalPower / 2 * 250 * 2.5
        for name, _ in pairs(addedSilentRunningCustomInfos) do
            pship:removeCustom("" .. name .. "")
        end
        if checkTotalPower > 5000 then
            addedSilentRunningCustomInfo(pship, "Engineering", "stealthInfoE1", "Energie output zu groß.")
            addedSilentRunningCustomInfo(pship, "Engineering", "stealthInfoE2", "Wir sind klar Sichtbar.")
        elseif checkTotalPower > 3500 then
            addedSilentRunningCustomInfo(pship, "Engineering", "stealthInfoE1", "Energie output bei " .. math.floor(checkTotalPower) .. "")
            addedSilentRunningCustomInfo(pship, "Engineering", "stealthInfoE2", "Vorsicht ab 5.000")
            addedSilentRunningCustomInfo(pship, "Engineering", "stealthInfoE3", "Keine Tarnung mehr möglich.")
        elseif checkTotalPower <= 3500 then
            addedSilentRunningCustomInfo(pship, "Engineering", "stealthInfoE", "Energie output bei " .. math.floor(checkTotalPower) .. "")
        end
        if checkTotalPower < 5000 then
            for _,object in pairs(cSObjects) do
                if (object.typeName == "CpuShip" or (object.typeName == "PlayerSpaceship" and (not (object == pship)) and not (object.silentFlag == 1))) then
                    --addGMFunction(object:getTypeName(), function() print=""  end)
                    local ssx, ssy = object:getPosition()
                    if object:getTypeName() == "Transport1x3" then
                        local silentRunningFaktor = 0.8
                        calcEnemyStealthDetectZone(ssx,ssy,silentRunningFaktor,totalPower,pship)
                    elseif object:getTypeName() == "Adder MK3" then
                        local silentRunningFaktor = 1.6
                        calcEnemyStealthDetectZone(ssx,ssy,silentRunningFaktor,totalPower,pship)
                    elseif object:getTypeName() == "Adv. Gunship" then
                        local silentRunningFaktor = 3.2
                        calcEnemyStealthDetectZone(ssx,ssy,silentRunningFaktor,totalPower,pship)
                    else
                        local silentRunningFaktor = 1.5
                        calcEnemyStealthDetectZone(ssx,ssy,silentRunningFaktor,totalPower,pship)
                    end
                end
            end
        end
        pship.stealthTimer = 0
        for _, stealthz in ipairs(pship.stealthZones) do
            if stealthz:isInside(pship) or (checkTotalPower > 5000) then
                setSilentFlag(pship)
                --pship:removeCustom("silent_running_engineer")
                pship:addCustomMessage("Science", "silent_running_broken_S", "SIE WURDEN ENTDECKT")
                pship:addCustomMessage("Helms", "silent_running_broken_H", "SIE WURDEN ENTDECKT")
                pship:addCustomMessage("Engineering", "silent_running_broken_E", "SIE WURDEN ENTDECKT")
            end
        end
    end
end

calcEnemyStealthDetectZone = function(ssx,ssy,silentRunningFaktor,totalPower,pship)
    numPoints = 20
    local radius = totalPower * 125 * silentRunningFaktor
    local circlePoints = calculateCirclePoints(ssx, ssy, radius, numPoints)
    if radius > 100 then
        local zone = Zone():setPoints(table.unpack(circlePoints)):setColor(255, 0, 0, 100)
        table.insert(pship.stealthZones, zone)
    end
end

function calculateCirclePoints(middleX, middleY, radius, numPoints)
    local points = {}

    for i = 1, numPoints do
        local angle = (i - 1) * (2 * math.pi / numPoints)
        local x = middleX + radius * math.cos(angle)
        local y = middleY + radius * math.sin(angle)
        table.insert(points, x)
        table.insert(points, y)
    end

    return points
end

function addedSilentRunningCustomInfo(pship, station, name, text)
    pship:addCustomInfo(station, name, text)
    addedSilentRunningCustomInfos[name] = true
end

setSilentFlag = function(pship)
    if pship.silentFlag == 0 then
        local sx,sy = pship:getPosition()
        local cSObjects = getObjectsInRadius(sx, sy, 60000)
        local isTargeted = false
        for _,object in pairs(cSObjects) do
            if (object.typeName == "CpuShip" or (object.typeName == "PlayerSpaceship" and not (object == pship) and not object.silentFlag == 1)) then
                if (object:getTarget() == pship) then
                    isTargeted = true
                    pship:addCustomMessage("Science", "silent_running_broken_S", [[Wir werden noch von einem Feind angepeilt.
Schleichfahrt nicht möglich.]])
                    pship:addCustomMessage("Engineering", "silent_running_broken_E", [[ERROR:
Schleichfahrt algorythmus unterbrochen.]])
                end
            end
        end
        if isTargeted == false then
            pship.silentFlag = 1
            pship:setRadarTrace("empty.png")
            pship.save_call_sign = pship:getCallSign()
            pship:setCallSign("")
        end
    else
        pship.silentFlag = 0
        pship:setCallSign(pship.save_call_sign)
        if pship:getTypeName() == "Atlantis" then
            pship:setRadarTrace("dread.png")
        end
        if pship:getTypeName() == "MP52 Hornet" then
            pship:setRadarTrace("fighter.png")
        end
        for _, stealthz in ipairs(pship.stealthZones) do
            stealthz:destroy()
        end
        for name, _ in pairs(addedSilentRunningCustomInfos) do
            pship:removeCustom("" .. name .. "")
        end
    end
end