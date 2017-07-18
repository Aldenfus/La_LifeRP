RegisterServerEvent('menumedic:healcoma_s')
AddEventHandler('menumedic:healcoma_s', function(netID)
  TriggerEvent('es:getPlayerFromId', netID, function(user)
    if user.status == "dead" then
		TriggerClientEvent("menumedic:healcoma_f", source)
		TriggerEvent("es_em:sv_resurectPlayer", netID)
	else
		TriggerClientEvent("itinerance:notif", source, "~r~La cible n'est pas dans le coma !")
	end
  end)
end)

RegisterServerEvent('menumedic:heal_s')
AddEventHandler('menumedic:heal_s', function(netID)
  TriggerEvent('es:getPlayerFromId', netID, function(user)
	TriggerClientEvent("itinerance:notif", source, "~g~Vous avez soigné la cible avec succès !")
	TriggerClientEvent("menumedic:heal_f", netID)
  end)
end)