--Zwischenmission (ZM): Hilfe im Nebel

--Zwischensystem mit (mind) 2 Sprungtoren
--DONE mehrere Kosmische Nebel (kn)
--vereinzelte Schiffswracks
--Spieler können Rettungskapsel unbekannter Bauart scannen
--Kommunikation mit Kapsel gestört aber Bio Ausschlag
--wenn Rettung, dann Information, dass ein Schiff im Nebel mit Asteroid kollidiert und Schaden genommen hat
--Person war in einer stark betroffenen Sektion
--konnte sich mit Kapsel retten
--andere Crewmitglieder in Gefahr
--Bitte um Hilfe
--
--Wenn Spieler Gebiet erreichen
--Asteroidenfeld
--scan? Wenn ja, mehrere Wracks, ein offensichtlich manövrierunfähiges Schiff mit Biosignatur
--auch scanbar, mehere Asteroiden mit einer sehr geringen elektronischen Signatur
--wenn sich Spieler dem manövrierunfähigen Schiff nähern, Hinterhalt!
--einige Asteroiden sind getarnte Schiffe, das manövrierunfähige Schiff ist wieder voll funktionsfähig, alle fahren Waffen und Schilde hoch
--"geretteter" entpuppt sich als Saboteur und deaktiviert ein oder mehrere wichtige Systeme (Schilde, Waffen)
--Aufforderung der Angreifer Frachtraum zu öffnen und alles zu übergeben
--wenn Zustimmung der Spieler : Verlust jeglicher Fracht und Torpedos (und ähnliches)
--danach Beschuss der Spieler
--Flucht möglich

systemXSetTrap = function()
    Artifact():setPosition(100411, -46738):setModel("debris-blob"):setRotation(20)
    Artifact():setPosition(100211, -46438):setModel("debris-blob"):setRotation(350)
    Artifact():setPosition(100411, -46338):setModel("debris-cubesat"):setRotation(0)
    Artifact():setPosition(100811, -46838):setModel("SensorBuoyMKI"):setRotation(0)
--AdlerLongRangeScoutYellow
    generateFakeAsteroidsSystemX()

    CpuShip():setFaction("Independent"):setTemplate("Gunship"):setPosition(94132, -76231):setWeaponStorage("Homing", 10)
end

generateFakeAsteroidsSystemX = function()
    FakeAsteroidsSystemX = {
        Artifact():setPosition(87060, -70896):setRadarTraceColor(255, 200, 100):setModel("AdlerLongRangeScoutYellow"),
        Artifact():setPosition(87866, -76687):setRadarTraceColor(255, 200, 100):setModel("AdlerLongRangeScoutYellow"),
        Artifact():setPosition(99704, -76506):setRadarTraceColor(255, 200, 100):setModel("AdlerLongRangeScoutYellow"),
        Artifact():setPosition(100537, -71927):setRadarTraceColor(255, 200, 100):setModel("AdlerLongRangeScoutYellow"),
        Artifact():setPosition(96290, -67305):setRadarTraceColor(255, 200, 100):setModel("AdlerLongRangeScoutYellow"),
        Artifact():setPosition(103562, -65029):setRadarTraceColor(255, 200, 100):setModel("AdlerLongRangeScoutYellow")
    }
end

replaceFakeAsteroidsWithCPUShips = function()
    for _, sysXartefact in pairs(FakeAsteroidsSystemX) do
        sysXartefact:destroy()
    end
    FakeAsteroidCPUShipGroup = {
        CpuShip():setFaction("Independent"):setTemplate("Adder MK3"):setPosition(87060, -70896):setWeaponStorage("HVLI", 1):setRadarTrace("asteroid_blip.png"),
        CpuShip():setFaction("Independent"):setTemplate("Adder MK3"):setPosition(87866, -76687):setWeaponStorage("HVLI", 1):setRadarTrace("asteroid_blip.png"),
        CpuShip():setFaction("Independent"):setTemplate("Adder MK3"):setPosition(99704, -76506):setWeaponStorage("HVLI", 1):setRadarTrace("asteroid_blip.png"),
        CpuShip():setFaction("Independent"):setTemplate("Adder MK3"):setPosition(100537, -71927):setWeaponStorage("HVLI", 1):setRadarTrace("asteroid_blip.png"),
        CpuShip():setFaction("Independent"):setTemplate("Adder MK3"):setPosition(96290, -67305):setWeaponStorage("HVLI", 1):setRadarTrace("asteroid_blip.png"),
        CpuShip():setFaction("Independent"):setTemplate("Adder MK3"):setPosition(103562, -65029):setWeaponStorage("HVLI", 1):setRadarTrace("asteroid_blip.png")
    }
end

--Optionen für Hinterhalt:
-- Wenn überlebender an Board:
-- Ausfall von Waffen, Schilden, Warp.
-- Impuls auf 25%
-- Ultimatum:
-- 1. Nachricht mit Timer
-- 2. Bereich im Umkreis des Spielerschiffs abstecken
-- 3. Energie Status von Allem bis auf Reaktor auf 0

