fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'pigeon-no-combat-roll'
author 'Pigeon Studios'
description 'Stops players combat rolling while they aim a gun, or limits them to one roll every few seconds.'
version '1.0.0'
repository 'https://github.com/pigeon-studios-uk/pigeon-no-combat-roll'

-- Pigeon Studios version registry entry, read by server/version_check.lua.
pigeon_slug 'pigeon-no-combat-roll'

client_scripts {
    'configuration/config.lua',
    'locales/*.lua',
    'client/main.lua',
}

server_scripts {
    'server/version_check.lua',
}
