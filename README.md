# txAdmin Discord Logs

A logging system for FiveM servers that sends txAdmin actions to Discord via webhooks.


## Features

- Log all txAdmin actions to your Discord server
- Customizable webhook appearance
- Enable/disable individual event logging
- Duplicate prevention system
- Beautiful embed formatting with player information
- Support for all txAdmin menu options:
  - Player management (teleport, heal, freeze, etc.)
  - Vehicle management (spawn, fix, delete, boost)
  - Troll options (drunk, fire, wild attack)
  - Admin tools (noclip, godmode, etc.)

## Requirements

- FiveM Server
- txAdmin
- Discord server with a webhook URL

## Installation

1. Download the resource
2. Place it in your server's resources folder
3. Add `ensure tx_discordlogs` to your server.cfg
4. Configure the webhook URL in config.lua
5. Restart your server

## Configuration

Open `config.lua` and customize the following settings:

```lua
Config = {}

-- Your Discord webhook URL (REQUIRED)
Config.WebhookURL = "YOUR_DISCORD_WEBHOOK_URL_HERE"

-- Enable or disable specific event logging
Config.LogEvents = {
    SetPlayerMode = true,
    NoClipToggle = true,
    -- ... other events
}

-- Customize webhook appearance
Config.ServerName = "Your Server Name"
Config.BotName = "TxAdmin Logs"
Config.BotAvatar = "YOUR_AVATAR_URL"
Config.EmbedColor = 3447003 -- Discord blue color
```

### Event Types

You can enable or disable logging for each type of event:

| Event | Description |
|-------|-------------|
| SetPlayerMode | Player mode changes (godmode, noclip, etc.) |
| NoClipToggle | Toggles noclip mode |
| TpToCoords | Teleports to coordinates |
| TpToWaypoint | Teleports to waypoint |
| TpBack | Teleports back to previous location |
| TpToPlayer | Teleports to another player |
| SummonPlayer | Summons another player |
| ClearArea | Clears area of objects |
| SpawnWeapon | Spawns a weapon |
| HealPlayer | Heals another player |
| HealAllPlayers | Heals all players |
| HealMyself | Heals self |
| SendAnnouncement | Sends server announcement |
| TrollSetDrunk | Sets player drunk |
| TrollSetOnFire | Sets player on fire |
| TrollWildAttack | Triggers wild attack on player |
| FreezePlayer | Freezes/unfreezes player |
| SpectatePlayer | Spectates player |
| VehicleFix | Repairs vehicle |
| VehicleBoost | Boosts vehicle |
| VehicleSpawn | Spawns vehicle |
| VehicleDelete | Deletes vehicle |

## Usage

Once installed and configured, the resource will automatically log all txAdmin actions to your Discord channel.

### Example Logs

- **Player Teleport**: When an admin teleports to a player
- **Vehicle Spawn**: When an admin spawns a vehicle
- **Heal Player**: When an admin heals a player
- **NoClip Toggle**: When an admin toggles noclip

Each log includes:
- Action title and description
- Player name and ID
- Player location
- Date and time of action

## Support

For any issues or feature requests, please open an issue on GitHub.

## Credits

- **Author**: f1f
- **Version**: 1.0.0
- **License**: MIT

---

Enjoy tracking all your admin actions in your Discord server!
