ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	


ESX.RegisterServerCallback('richrp_lombard:getplayeritemcount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer ~= nil then
		local items = xPlayer.getInventoryItem(item)
		
		if items == nil then
			cb(0)
		else
			cb(items.count)
		end
	end
end)


RegisterServerEvent('richrp_lombard:requestsellitem')
AddEventHandler('richrp_lombard:requestsellitem', function(item, price, quantity)
    local xPlayer = ESX.GetPlayerFromId(source)
    local lejbel = ESX.GetItemLabel(item)
    local ilosc = price * quantity

    if xPlayer ~= nil then 
        TriggerClientEvent('esx:showNotification', xPlayer.source, '~g~Sprzedałeś x'..quantity..' '..lejbel..' za '..ilosc..'$')
        xPlayer.removeInventoryItem(item, quantity)
        xPlayer.addMoney(ilosc)
    end
end) 