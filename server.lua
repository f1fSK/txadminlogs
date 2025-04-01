local recentLogs = {}

function sendToDiscord(title, description, playerInfo)
    local logIdentifier = playerInfo.source .. "_" .. title .. "_" .. math.floor(GetGameTimer() / 1000)

    if recentLogs[logIdentifier] then
        return
    end

    recentLogs[logIdentifier] = true

    SetTimeout(2000, function()
        recentLogs[logIdentifier] = nil
    end)

    local time = os.date("%H:%M:%S")
    local date = os.date("%d.%m.%Y")
    
    local embed = {
        {
            ["title"] = "📝 " .. title,
            ["description"] = description,
            ["type"] = "rich",
            ["color"] = Config.EmbedColor,
            ["author"] = {
                ["name"] = playerInfo.name .. " (ID: " .. playerInfo.source .. ")",
                ["icon_url"] = "https://ui-avatars.com/api/?background=random&name=" .. playerInfo.name
            },
            ["thumbnail"] = {
                ["url"] = "https://repository-images.githubusercontent.com/183337178/699b2500-cad9-11e9-9e0a-96af2a134587",
            },
            ["footer"] = {
                ["text"] = date .. " | " .. time .. " | " .. Config.ServerName,
                ["icon_url"] = Config.BotAvatar
            },
            ["fields"] = {
                {
                    ["name"] = "📍 Location",
                    ["value"] = "X: " .. math.floor(playerInfo.coords.x) .. ", Y: " .. math.floor(playerInfo.coords.y) .. ", Z: " .. math.floor(playerInfo.coords.z),
                    ["inline"] = true
                }
            }
        }
    }

    PerformHttpRequest(Config.WebhookURL, function(err, text, headers) end, 'POST', json.encode({
        username = Config.BotName,
        embeds = embed,
        avatar_url = Config.BotAvatar
    }), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('f1f_txlogs:server:sendWebhook')
AddEventHandler('f1f_txlogs:server:sendWebhook', function(title, description, playerInfo)
    sendToDiscord(title, description, playerInfo)
end)

RegisterServerEvent('txsv:req:tpToPlayer')
AddEventHandler('txsv:req:tpToPlayer', function(targetId)
    if Config.LogEvents.TpToPlayer then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        local targetName = GetPlayerName(targetId)
        sendToDiscord('Teleport To Player', 'Teleported to player: ' .. targetName .. ' (ID: ' .. targetId .. ')', playerInfo)
    end
end)

RegisterServerEvent('txsv:req:bringPlayer')
AddEventHandler('txsv:req:bringPlayer', function(targetId)
    if Config.LogEvents.SummonPlayer then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        local targetName = GetPlayerName(targetId)
        sendToDiscord('Summon Player', 'Summoned player: ' .. targetName .. ' (ID: ' .. targetId .. ')', playerInfo)
    end
end)

RegisterServerEvent('txsv:req:clearArea')
AddEventHandler('txsv:req:clearArea', function(radius)
    if Config.LogEvents.ClearArea then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        sendToDiscord('Clear Area', 'Cleared area with radius: ' .. radius, playerInfo)
    end
end)

RegisterServerEvent('txsv:req:healPlayer')
AddEventHandler('txsv:req:healPlayer', function(targetId)
    if Config.LogEvents.HealPlayer then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        local targetName = GetPlayerName(targetId)
        sendToDiscord('Heal Player', 'Healed player: ' .. targetName .. ' (ID: ' .. targetId .. ')', playerInfo)
    end
end)

RegisterServerEvent('txsv:req:healEveryone')
AddEventHandler('txsv:req:healEveryone', function()
    if Config.LogEvents.HealAllPlayers then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        sendToDiscord('Heal All Players', 'Healed all players on the server', playerInfo)
    end
end)

RegisterServerEvent('txsv:req:sendAnnouncement')
AddEventHandler('txsv:req:sendAnnouncement', function(message)
    if Config.LogEvents.SendAnnouncement then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        sendToDiscord('Announcement', 'Sent announcement: ' .. message, playerInfo)
    end
end)

RegisterServerEvent('txsv:req:tpToCoords')
AddEventHandler('txsv:req:tpToCoords', function(x, y, z)
    if Config.LogEvents.TpToCoords then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        sendToDiscord('Teleport To Coordinates', 'Teleported to coordinates: X: ' .. x .. ', Y: ' .. y .. ', Z: ' .. z, playerInfo)
    end
end)

RegisterServerEvent('txsv:req:tpToWaypoint')
AddEventHandler('txsv:req:tpToWaypoint', function()
    if Config.LogEvents.TpToWaypoint then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        sendToDiscord('Teleport To Waypoint', 'Teleported to waypoint', playerInfo)
    end
end)

RegisterServerEvent('txsv:req:healMyself')
AddEventHandler('txsv:req:healMyself', function()
    if Config.LogEvents.HealMyself then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        sendToDiscord('Heal Self', 'Healed themselves', playerInfo)
    end
end)

RegisterServerEvent('txsv:req:tpBack')
AddEventHandler('txsv:req:tpBack', function()
    if Config.LogEvents.TpBack then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        sendToDiscord('Teleport Back', 'Teleported back to previous location', playerInfo)
    end
end)

RegisterServerEvent('txsv:req:freezePlayer')
AddEventHandler('txsv:req:freezePlayer', function(targetId)
    if Config.LogEvents.FreezePlayer then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        local targetName = GetPlayerName(targetId)
        sendToDiscord('Player Freeze', 'Toggled freeze status for player: ' .. targetName .. ' (ID: ' .. targetId .. ')', playerInfo)
    end
end)

RegisterServerEvent('txsv:req:spectate:cycle')
AddEventHandler('txsv:req:spectate:cycle', function(currentTargetId, isNextPlayer)
    if Config.LogEvents.SpectatePlayer then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        local direction = isNextPlayer and "next" or "previous"
        sendToDiscord('Player Spectate', 'Cycled to ' .. direction .. ' player from: ' .. GetPlayerName(currentTargetId) .. ' (ID: ' .. currentTargetId .. ')', playerInfo)
    end
end)

RegisterServerEvent('txsv:req:vehicle:fix')
AddEventHandler('txsv:req:vehicle:fix', function()
    if Config.LogEvents.VehicleFix then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        sendToDiscord('Vehicle Fix', 'Repaired current vehicle', playerInfo)
    end
end)

RegisterServerEvent('txsv:req:vehicle:boost')
AddEventHandler('txsv:req:vehicle:boost', function()
    if Config.LogEvents.VehicleBoost then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        sendToDiscord('Vehicle Boost', 'Boosted current vehicle', playerInfo)
    end
end)

RegisterServerEvent('txsv:req:vehicle:spawn:fivem')
AddEventHandler('txsv:req:vehicle:spawn:fivem', function(model, modelType)
    if Config.LogEvents.VehicleSpawn then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        sendToDiscord('Vehicle Spawn', 'Spawned vehicle: ' .. model, playerInfo)
    end
end)

RegisterServerEvent('txsv:req:vehicle:delete')
AddEventHandler('txsv:req:vehicle:delete', function(vehNetId)
    if Config.LogEvents.VehicleDelete then
        local playerInfo = {
            name = GetPlayerName(source),
            coords = GetEntityCoords(GetPlayerPed(source)),
            source = source
        }
        
        sendToDiscord('Vehicle Delete', 'Deleted a vehicle', playerInfo)
    end
end)

RegisterServerEvent('txsv:logger:menuEvent')
AddEventHandler('txsv:logger:menuEvent', function(src, eventType, allowed, data)
    if not allowed then return end
    
    local playerInfo = {
        name = GetPlayerName(src),
        coords = GetEntityCoords(GetPlayerPed(src)),
        source = src
    }
    
    local title = 'TxAdmin Action'
    local description = 'Unknown action'
    local skipEvents = {
        ['vehicleRepair'] = true,  
        ['vehicleBoost'] = true,   
        ['spawnVehicle'] = true,   
        ['deleteVehicle'] = true   
    }
    
    if skipEvents[eventType] then
        return
    end

    if eventType == 'teleportCoords' and Config.LogEvents.TpToCoords then
        title = 'Teleport To Coordinates'
        description = 'Teleported to coordinates: X: ' .. data.x .. ', Y: ' .. data.y .. ', Z: ' .. data.z
        sendToDiscord(title, description, playerInfo)
    elseif eventType == 'teleportWaypoint' and Config.LogEvents.TpToWaypoint then
        title = 'Teleport To Waypoint'
        description = 'Teleported to waypoint'
        if data then
            description = description .. ' at X: ' .. data.x .. ', Y: ' .. data.y .. ', Z: ' .. data.z
        end
        sendToDiscord(title, description, playerInfo)
    elseif eventType == 'healSelf' and Config.LogEvents.HealMyself then
        title = 'Heal Self'
        description = 'Healed themselves'
        sendToDiscord(title, description, playerInfo)
    elseif eventType == 'healPlayer' and Config.LogEvents.HealPlayer then
        title = 'Heal Player'
        local targetName = "Unknown"
        if type(data) == 'number' then
            targetName = GetPlayerName(data) or "ID: " .. data
        end
        description = 'Healed player: ' .. targetName
        sendToDiscord(title, description, playerInfo)
    elseif eventType == 'freezePlayer' and Config.LogEvents.FreezePlayer then
        title = 'Player Freeze'
        local targetName = "Unknown"
        if type(data) == 'number' then
            targetName = GetPlayerName(data) or "ID: " .. data
        end
        description = 'Toggled freeze for player: ' .. targetName
        sendToDiscord(title, description, playerInfo)
    elseif eventType == 'drunkEffect' and Config.LogEvents.TrollSetDrunk then
        title = 'Troll - Set Drunk'
        local targetName = "Unknown"
        if type(data) == 'number' then
            targetName = GetPlayerName(data) or "ID: " .. data
        end
        description = 'Set player drunk: ' .. targetName
        sendToDiscord(title, description, playerInfo)
    elseif eventType == 'setOnFire' and Config.LogEvents.TrollSetOnFire then
        title = 'Troll - Set On Fire'
        local targetName = "Unknown"
        if type(data) == 'number' then
            targetName = GetPlayerName(data) or "ID: " .. data
        end
        description = 'Set player on fire: ' .. targetName
        sendToDiscord(title, description, playerInfo)
    elseif eventType == 'wildAttack' and Config.LogEvents.TrollWildAttack then
        title = 'Troll - Wild Attack'
        local targetName = "Unknown"
        if type(data) == 'number' then
            targetName = GetPlayerName(data) or "ID: " .. data
        end
        description = 'Triggered wild attack on player: ' .. targetName
        sendToDiscord(title, description, playerInfo)
    elseif eventType == 'vehicleRepair' and Config.LogEvents.VehicleFix then
        title = 'Vehicle Fix'
        description = 'Repaired current vehicle'
        sendToDiscord(title, description, playerInfo)
    elseif eventType == 'vehicleBoost' and Config.LogEvents.VehicleBoost then
        title = 'Vehicle Boost'
        description = 'Boosted current vehicle'
        sendToDiscord(title, description, playerInfo)
    elseif eventType == 'spawnVehicle' and Config.LogEvents.VehicleSpawn then
        title = 'Vehicle Spawn'
        description = 'Spawned vehicle'
        if data then
            description = description .. ': ' .. data
        end
        sendToDiscord(title, description, playerInfo)
    elseif eventType == 'deleteVehicle' and Config.LogEvents.VehicleDelete then
        title = 'Vehicle Delete'
        description = 'Deleted a vehicle'
        sendToDiscord(title, description, playerInfo)
    end
end)