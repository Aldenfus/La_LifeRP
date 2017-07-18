local price = 500 -- you may edit this to your liking. if "enableprice = false" ignore this one

--DO-NOT-EDIT-BELLOW-THIS-LINE--

RegisterServerEvent('carwash:checkmoney')
AddEventHandler('carwash:checkmoney', function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
				if tonumber(user.money) >= price then
					user:removeMoney((price))
					TriggerClientEvent('carwash:success', source)
				else
				  TriggerClientEvent('itinerance:notif', source, "~r~Vous avez besoin de " ..price.. "$ pour laver votre véhicule !")
				end
	end)
end)
