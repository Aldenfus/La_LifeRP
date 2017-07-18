local weed = 60
local meth = 60
local coke = 60
local police = 0
RegisterServerEvent('drogue:getcoke')
AddEventHandler('drogue:getcoke', function()
  TriggerClientEvent('f_drogue:getcoke',source,coke)
end)

RegisterServerEvent('drogue:getmeth')
AddEventHandler('drogue:getmeth', function()
  TriggerClientEvent('f_drogue:getmeth',source,meth)
end)

RegisterServerEvent('drogue:getweed')
AddEventHandler('drogue:getweed', function()
  TriggerClientEvent('f_drogue:getweed',source,weed)
end)

RegisterServerEvent('drogue:remcoke')
AddEventHandler('drogue:remcoke', function()
  coke = coke - 1
end)

RegisterServerEvent('drogue:remmeth')
AddEventHandler('drogue:remmeth', function()
  meth = meth - 1
end)

RegisterServerEvent('drogue:remweed')
AddEventHandler('drogue:remweed', function()
  weed = weed - 1
end)

local function AddDrogue()
	print(police)
	if police == 0 then
		if weed < 60 then
		weed = weed + 1
		end
		if meth < 60 then
		meth = meth + 1
		end
		if coke < 60 then
		coke = coke + 1
		end
	else
		if weed < 60 then
		weed = weed + tonumber(police)
		end
		if meth < 60 then
		meth = meth + tonumber(police)
		end
		if coke < 60 then
		coke = coke + tonumber(police)
		end
	end
	print('weed ='.. weed .. 'meth=' .. meth .. 'coke=' .. coke)
end

local function GetPolice()
	SetTimeout(60000, function()
		police = 0
		TriggerEvent("es:getPlayers", function(users)
		--print(police)
			--print(users[1].enService)
			if(users ~= nil) then
			for k,v in pairs(users)do
					SetTimeout(500, function()
					end)
					if v.enService == 1 then
					police = police + 1
					end
				end
		AddDrogue()
			end
		end)

		GetPolice()
	end)
end

GetPolice()

