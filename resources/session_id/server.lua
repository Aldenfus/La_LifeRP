require "resources/[essential]/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential2", "root", "Police911")
RegisterServerEvent('sessionID:spawnplayer')
AddEventHandler('sessionID:spawnplayer', function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
	local RAZ = MySQL:executeQuery("UPDATE users SET session_id = 0 WHERE session_id = '@nbID'",
							{['@nbID'] = source})
	local player = user.identifier
	local executed_query = MySQL:executeQuery("UPDATE users SET `session_id` = '@nbID' WHERE identifier = '@username'",
							{['@nbID'] = source, ['@username'] = player})
	if source == 1 then
		local RAZVehicule = MySQL:executeQuery("UPDATE user_vehicle SET vehicle_state = 'Rentré'")
	end
	end)
 end)