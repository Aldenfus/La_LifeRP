local coke = {
  [1] = {["name"] = "Champs de coke",["x"] = 349.97210693359, ["y"] = 6474.19921875, ["z"] = 29.87003326416, ["cost"] = 30000},
  [2] = {["name"] = "Traitement de coke #1",["x"] = 3820.8559570313 , ["y"] = 4442.6938476563 , ["z"] = 2.8098225593567 , ["cost"] = 50000},
  [3] = {["name"] = "Traitement de coke #2",["x"] = -3099.4482421875 , ["y"] = 341.9338684082 , ["z"] = 14.440857887268 , ["cost"] = 50000},
  [4] = {["name"] = "Vente de coke #1",["x"] = -1378.0701904297 , ["y"] = -622.20916748047 , ["z"] = 30.950565338135 , ["cost"] = 30000},
  [5] = {["name"] = "Vente de coke #2",["x"] = 448.2629699707 , ["y"] = -176.4065246582 , ["z"] = 71.254043579102 , ["cost"] = 30000}
}

local meth = {
  [1] = {["name"] = "Champs de meth",["x"] = 334.84967041016 , ["y"] = -1083.2797851563 , ["z"] = 29.435209274292 , ["cost"] = 50000},
  [2] = {["name"] = "Traitement de meth #1",["x"] = 1390.51037597656 , ["y"] = 3609.09399414063 , ["z"] = 38.9419288635254 , ["cost"] = 25000},
  [3] = {["name"] = "Traitement de meth #2",["x"] = 1389.52404785156 , ["y"] = 3604.15209960938 , ["z"] = 38.9419288635254 , ["cost"] = 25000},
  [4] = {["name"] = "Traitement de meth #3",["x"] = 1394.45300292969 , ["y"] = 3601.97973632813 , ["z"] = 38.94189453125 , ["cost"] = 25000},
  [5] = {["name"] = "Vente de meth",["x"] = 1443.0411376953 , ["y"] = 6333.455078125 , ["z"] = 23.868028640747 , ["cost"] = 50000}
}

local organe = {
    [1] = {["name"] = "Récolte d'organes",["x"] = 259.013244628906 , ["y"] = -1345.41711425781 , ["z"] = 24.537805557251 , ["cost"] = 10000},
    [2] = {["name"] = "Emballage d'organe",["x"] = 241.13232421875 , ["y"] = -1378.66235351563 , ["z"] = 40.5606536865234 , ["cost"] = 10000},
    [3] = {["name"] = "Identification d'organes",["x"] = 230.997146606445 , ["y"] = -1368.26647949219 , ["z"] = 39.7044486999512 , ["cost"] = 10000},
    [4] = {["name"] = "Vente d'organes",["x"] = -619.713073730469 , ["y"] = 323.185150146484 , ["z"] = 82.2636184692383 , ["cost"] = 50000},
}

local weed = {
  [1] = {["name"] = "Champs de weed",["x"] = 1875.8841552734 , ["y"] = 5056.6772460938 , ["z"] = 51.513126373291 , ["cost"] = 10000},
  [2] = {["name"] = "Traitement de weed",["x"] = 83.502479553223 , ["y"] = 6650.2631835938 , ["z"] = 32.19792175293 , ["cost"] = 10000},
  [3] = {["name"] = "Vente de weed",["x"] = 2477.1474609375 , ["y"] = 3763.0439453125 , ["z"] = 41.8897171020508 , ["cost"] = 10000},
}
--asd
RegisterServerEvent("menudrogue:sendData_s")
AddEventHandler("menudrogue:sendData_s", function()
    TriggerClientEvent("menudrogue:f_sendData", source, coke, meth, organe, weed)
end)

RegisterServerEvent("menudrogue:getCash_s")
AddEventHandler("menudrogue:getCash_s", function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    if (user) then
      local lecashy = user:getMoney()
      TriggerClientEvent("menudrogue:f_getCash", source, lecashy)
    else
      TriggerEvent("es:desyncMsg")
    end
  end)
end)

RegisterServerEvent("menudrogue:setCash")
AddEventHandler("menudrogue:setCash", function(amount)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    if (user) then
      user:removeMoney(amount)
    else
      TriggerEvent("es:desyncMsg")
    end
  end)
end)
