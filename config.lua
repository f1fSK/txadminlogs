Config = {}

Config.WebhookURL = "YOUR_WEBHOOK_URL" -- Discord webhook URL

Config.LogEvents = {
    SetPlayerMode = true, -- Log when a player changes their mode (e.g., God, NoClip, etc.)
    NoClipToggle = true, -- Log when a player toggles NoClip mode
    TpToCoords = true, -- Log when a player opens the teleport to coordinates dialog
    TpToWaypoint = true, -- Log when a player teleports to a waypoint
    TpBack = true, -- Log when a player teleports back to their previous location
    TpToPlayer = true, -- Log when a player teleports to another player
    SummonPlayer = true, -- Log when a player summons another player
    ClearArea = true, -- Log when a player clears an area (e.g., removes all vehicles, peds, etc.)
    SpawnWeapon = true, -- Log when a player spawns a weapon
    HealPlayer = true, -- Log when a player heals another player
    HealAllPlayers = true, -- Log when a player heals all players
    HealMyself = true, -- Log when a player heals themselves
    SendAnnouncement = true, -- Log when a player sends an announcement to all players
    TrollSetDrunk = true, -- Log when a player sets another player drunk
    TrollSetOnFire = true, -- Log when a player sets another player on fire
    TrollWildAttack = true, -- Log when a player sets another player to attack wild animals
    FreezePlayer = true, -- Log when a player freezes another player
    SpectatePlayer = true, -- Log when a player spectates another player
    VehicleFix = true, -- Log when a player fixes a vehicle
    VehicleBoost = true, -- Log when a player boosts a vehicle
    VehicleSpawn = true, -- Log when a player spawns a vehicle
    VehicleDelete = true -- Log when a player deletes a vehicle
}

Config.ServerName = "Your Server Name" -- Name of your server, will be displayed in the logs
Config.BotName = "TxAdmin Logs" -- Name of the bot that will send the logs
Config.BotAvatar = "YOUR_AVATAR_URL" -- Avatar URL of the bot that will send the logs
Config.EmbedColor = 3447003 -- Discord blue color