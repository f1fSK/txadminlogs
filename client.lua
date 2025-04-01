local function getPlayerInfo()
    local playerName = GetPlayerName(PlayerId())
    local playerCoords = GetEntityCoords(PlayerPedId())
    return {
        name = playerName,
        coords = playerCoords,
        source = GetPlayerServerId(PlayerId())
    }
end

RegisterNetEvent('txcl:setPlayerMode')
AddEventHandler('txcl:setPlayerMode', function(mode, ptfx)
    if Config.LogEvents.SetPlayerMode then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Player Mode Change', 'Changed player mode to: ' .. mode, playerInfo)
    end
end)

RegisterCommand('txAdmin:menu:noClipToggle', function()
    if Config.LogEvents.NoClipToggle then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'NoClip Toggle', 'Toggled NoClip mode', playerInfo)
    end
end, false)

RegisterCommand('txAdmin:menu:tpToCoords', function()
    if Config.LogEvents.TpToCoords then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Teleport To Coords', 'Opened TP to coords dialog', playerInfo)
    end
end, false)

RegisterNetEvent('txAdmin:events:tpToWaypoint')
AddEventHandler('txAdmin:events:tpToWaypoint', function()
    if Config.LogEvents.TpToWaypoint then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Teleport To Waypoint', 'Teleported to waypoint', playerInfo)
    end
end)

RegisterNetEvent('txAdmin:events:tpBack')
AddEventHandler('txAdmin:events:tpBack', function()
    if Config.LogEvents.TpBack then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Teleport Back', 'Teleported back to previous location', playerInfo)
    end
end)

RegisterNetEvent('txAdmin:events:tpToPlayer')
AddEventHandler('txAdmin:events:tpToPlayer', function(targetId)
    if Config.LogEvents.TpToPlayer then
        local playerInfo = getPlayerInfo()
        local targetName = GetPlayerName(GetPlayerFromServerId(targetId))
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Teleport To Player', 'Teleported to player: ' .. targetName .. ' (ID: ' .. targetId .. ')', playerInfo)
    end
end)

RegisterNetEvent('txAdmin:events:summonPlayer')
AddEventHandler('txAdmin:events:summonPlayer', function(targetId)
    if Config.LogEvents.SummonPlayer then
        local playerInfo = getPlayerInfo()
        local targetName = GetPlayerName(GetPlayerFromServerId(targetId))
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Summon Player', 'Summoned player: ' .. targetName .. ' (ID: ' .. targetId .. ')', playerInfo)
    end
end)

RegisterNetEvent('txAdmin:events:clearArea')
AddEventHandler('txAdmin:events:clearArea', function(radius)
    if Config.LogEvents.ClearArea then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Clear Area', 'Cleared area with radius: ' .. radius, playerInfo)
    end
end)

RegisterNetEvent('txAdmin:events:spawnWeapon')
AddEventHandler('txAdmin:events:spawnWeapon', function(weapon)
    if Config.LogEvents.SpawnWeapon then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Spawn Weapon', 'Spawned weapon: ' .. weapon, playerInfo)
    end
end)

RegisterNetEvent('txAdmin:events:healPlayer')
AddEventHandler('txAdmin:events:healPlayer', function(targetId)
    if Config.LogEvents.HealPlayer then
        local playerInfo = getPlayerInfo()
        local targetName = GetPlayerName(GetPlayerFromServerId(targetId))
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Heal Player', 'Healed player: ' .. targetName .. ' (ID: ' .. targetId .. ')', playerInfo)
    end
end)

RegisterNetEvent('txAdmin:events:healAllPlayers')
AddEventHandler('txAdmin:events:healAllPlayers', function()
    if Config.LogEvents.HealAllPlayers then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Heal All Players', 'Healed all players on the server', playerInfo)
    end
end)

RegisterNetEvent('txAdmin:events:healMyself')
AddEventHandler('txAdmin:events:healMyself', function()
    if Config.LogEvents.HealMyself then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Heal Self', 'Healed themselves', playerInfo)
    end
end)

RegisterNetEvent('txAdmin:events:announcement')
AddEventHandler('txAdmin:events:announcement', function(message)
    if Config.LogEvents.SendAnnouncement then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Announcement', 'Sent announcement: ' .. message, playerInfo)
    end
end)

RegisterNetEvent('txcl:tpToCoords')
AddEventHandler('txcl:tpToCoords', function(x, y, z)
    if Config.LogEvents.TpToCoords then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Teleport To Coordinates', 'Teleported to coordinates: X: ' .. x .. ', Y: ' .. y .. ', Z: ' .. z, playerInfo)
    end
end)

RegisterNetEvent('txcl:tpToWaypoint')
AddEventHandler('txcl:tpToWaypoint', function()
    if Config.LogEvents.TpToWaypoint then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Teleport To Waypoint', 'Teleported to waypoint', playerInfo)
    end
end)

RegisterNetEvent('txcl:heal')
AddEventHandler('txcl:heal', function()
    if Config.LogEvents.HealMyself then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Heal Self', 'Healed themselves', playerInfo)
    end
end)

RegisterNetEvent('txAdmin:client:tpBack')
AddEventHandler('txAdmin:client:tpBack', function()
    if Config.LogEvents.TpBack then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Teleport Back', 'Teleported back to previous location', playerInfo)
    end
end)

RegisterNetEvent('txcl:setDrunk')
AddEventHandler('txcl:setDrunk', function()
    if Config.LogEvents.TrollSetDrunk then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Troll - Set Drunk', 'Was set drunk by an admin', playerInfo)
    end
end)

RegisterNetEvent('txcl:setOnFire')
AddEventHandler('txcl:setOnFire', function()
    if Config.LogEvents.TrollSetOnFire then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Troll - Set On Fire', 'Was set on fire by an admin', playerInfo)
    end
end)

RegisterNetEvent('txcl:wildAttack')
AddEventHandler('txcl:wildAttack', function()
    if Config.LogEvents.TrollWildAttack then
        local playerInfo = getPlayerInfo()
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Troll - Wild Attack', 'Was targeted with wild attack by an admin', playerInfo)
    end
end)

RegisterNetEvent('txcl:setFrozen')
AddEventHandler('txcl:setFrozen', function(isFrozen)
    if Config.LogEvents.FreezePlayer then
        local playerInfo = getPlayerInfo()
        local status = isFrozen and "frozen" or "unfrozen"
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Player Freeze', 'Was ' .. status .. ' by an admin', playerInfo)
    end
end)

RegisterNetEvent('txcl:spectatePlayer')
AddEventHandler('txcl:spectatePlayer', function(targetId)
    if Config.LogEvents.SpectatePlayer then
        local playerInfo = getPlayerInfo()
        local targetName = GetPlayerName(GetPlayerFromServerId(targetId))
        TriggerServerEvent('f1f_txlogs:server:sendWebhook', 'Spectate Player', 'Started spectating player: ' .. targetName .. ' (ID: ' .. targetId .. ')', playerInfo)
    end
end)

RegisterNetEvent('txcl:vehicle:fix')
AddEventHandler('txcl:vehicle:fix', function()
end)

RegisterNetEvent('txcl:vehicle:boost')
AddEventHandler('txcl:vehicle:boost', function()
end)

RegisterNetEvent('txcl:seatInVehicle')
AddEventHandler('txcl:seatInVehicle', function(vehNetId, seatIndex)
end)