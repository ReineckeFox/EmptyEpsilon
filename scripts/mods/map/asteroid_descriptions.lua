-- Give all Asteroids a Description
setAsteroidDescription = function()
    for _, obj in ipairs(getAllObjects()) do
        if obj.typeName == "Asteroid" then
            obj:setDescriptions(ad_0[1], ad_0[2]):setScanningParameters(1, 1)
        end
	end
end


-- ad == 0
ad_0 = {
   "Passive Analyse des Asteroiden:\n- Ungleichmäßige, raue Oberfläche.\n- Neutrale Lichtreflexion.\n- Homogene Gravitationsverteilung.\n- Keine elektromagnetische Strahlung.\n- Keine thermische Signaturen.\n- Keine radioaktive Emissionen.",
   "Test2"
}