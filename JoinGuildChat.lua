searchForGuild = function()
    g_game.requestChannels()
    schedule(1000, function()
        local channelsWindow = modules.game_console.channelsWindow
        if channelsWindow then
            local channelListPanel = channelsWindow:getChildById('channelList')
            for index, value in ipairs(channelListPanel:getChildren()) do
                if value.channelId == 0 then
                    guild = value:getText():trim()
                    info(guild)
                    channelsWindow:destroy()
                    return true
                end
            end
            channelsWindow:destroy()
        end
        return schedule(3000, searchForGuild)
    end)
end

macro(1, function()
    if not guild then
        if not requestedGuild then
            requestedGuild = true
            searchForGuild()
        end
        return
    end
  if getChannelId(guild) then return end
    return g_game.joinChannel(0) and delay(500)
end)
