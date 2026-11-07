--[[
    Pigeon No Combat Roll: client.

    In GTA, pressing jump while aiming a gun makes the character roll sideways, which players use to dodge
    shots over and over. While the player is on foot, holding a gun and aiming, the jump control is
    blocked, so they can't roll. With Config.Mode = 'cooldown' they can roll once every few seconds instead.

    Outside that it only checks four times a second.
]]

local IDLE_MS = 250
local JUMP = 22                -- INPUT_JUMP: the roll while aiming
local AIM = 25                 -- INPUT_AIM
local GUNS = 4 | 2             -- IsPedArmed: guns and throwables, not fists or melee weapons

-- 'auto' follows ox_lib's language (the ox:locale convar), and English when that isn't set.
local locale = Config.Locale == 'auto' and GetConvar('ox:locale', 'en') or Config.Locale
local strings = Locales[locale] or Locales.en
local lastMessage = -math.huge
local lastRoll = -math.huge

local function notify(text)
    local mode = Config.Notifications
    if mode == 'ox_lib' or (mode == 'auto' and GetResourceState('ox_lib') == 'started') then
        TriggerEvent('ox_lib:notify', { title = strings.title, description = text, type = 'error' })
    else
        BeginTextCommandThefeedPost('STRING')
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandThefeedPostTicker(false, false)
    end
end

local function aiming()
    return IsPlayerFreeAiming(PlayerId()) or IsControlPressed(0, AIM) or IsDisabledControlPressed(0, AIM)
end

local function cooldownMs()
    return math.max(0, (Config.CooldownSeconds or 0) * 1000)
end

local function whileAiming()
    local now = GetGameTimer()

    if Config.Mode == 'cooldown' and now - lastRoll >= cooldownMs() then
        -- A roll is allowed: let this press through and start the cooldown.
        if IsControlJustPressed(0, JUMP) then lastRoll = now end
        return
    end

    DisableControlAction(0, JUMP, true)
    if IsDisabledControlJustPressed(0, JUMP) and Config.ShowMessage and now - lastMessage >= (Config.MessageCooldown or 4) * 1000 then
        lastMessage = now
        notify(Config.Mode == 'cooldown' and strings.wait or strings.no_roll)
    end
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedOnFoot(ped) and IsPedArmed(ped, GUNS) then
            -- Checked every frame while holding a gun, so the roll is blocked the moment they aim.
            if aiming() then whileAiming() end
            Wait(0)
        else
            Wait(IDLE_MS)
        end
    end
end)
