-- get all Object
-- if not PlayerShip -> destroy()
makeCleanup = function()
	for _, obj in ipairs(getAllObjects()) do
        if obj.typeName ~= "PlayerSpaceship" then
            obj:destroy()
        end
	end
end