Config = {}

-- Language file from locales/ to use, such as 'en'.
Config.Locale = 'en'

-- 'never'     players can't roll while aiming a gun.
-- 'cooldown'  they can roll once, then not again for Config.CooldownSeconds.
Config.Mode = 'never'
Config.CooldownSeconds = 5

-- Tell the player why they didn't roll. They're told at most once every Config.MessageCooldown seconds.
Config.ShowMessage = false
Config.MessageCooldown = 4

-- How the message is shown.
-- 'auto' uses ox_lib notifications if ox_lib is running, otherwise GTA's notification feed.
-- 'ox_lib' or 'gta' to force one.
Config.Notifications = 'auto'

-- Update checks are controlled in server.cfg for every Pigeon Studios resource at once:
--     set pigeon_update_check "on"      (default)  |  "quiet"  |  "off"
