setDefaultTab("Main")

local ConfigPainel = "Config"
local ui = setupUI([[
ssPanel < Panel
  margin: 10
  layout:
    type: verticalBox
    
Panel
  height: 20
  Button
    id: editspell
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    color: green
    anchors.right: parent.right
    height: 20
    text: - Mc Control -
]])
ui:setId(ConfigPainel)

local McControlWindows = setupUI([[

MainWindow
  !text: tr('MC Config')
  size: 250 380
  @onEscape: self:hide()

  TabBar
    id: tmpTabBar
    margin-left: 60
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right

  Panel
    id: tmpTabContent
    anchors.top: tmpTabBar.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 3
    size: 200 285
    image-source: /data/images/ui/panel_flat
    image-border: 6

  Button
    id: closeButton
    !text: tr('Close')
    font: cipsoftFont
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    size: 45 21
    margin-top: 15
    margin-right: 1  
]], g_ui.getRootWidget())

local rootWidget = g_ui.getRootWidget()
if rootWidget then
    McControlWindows:hide()
    local tabBar = McControlWindows.tmpTabBar
    tabBar:setContentWidget(McControlWindows.tmpTabContent)

    for v = 1, 1 do
        local onPainel = g_ui.createWidget("ssPanel") -- Creates Panel
        onPainel:setId("panelButtons") -- sets ID
        tabBar:addTab("On", onPainel)
        local offPainel = g_ui.createWidget("ssPanel")
        offPainel:setId("panelButtons") -- sets ID
        tabBar:addTab("Off", offPainel)
        local MacrosPainel = g_ui.createWidget("ssPanel")
        MacrosPainel:setId("panelButtons") -- sets ID
        tabBar:addTab("Macros", MacrosPainel)

        UI.Button("Imortal", function() 
          sayChannel(0,'.55 useImortal') 
        end, onPainel)

        UI.Button("BackStackEsquerda", function() 
          sayChannel(0,'.55 voltar esquerda') 
        end, onPainel)

        UI.Button("BackStackDireita", function() 
          sayChannel(0,'.55 voltar direita') 
        end, onPainel)

        UI.Button("StackStair", function() 
          sayChannel(0,'.55 wait ponte') 
        end, onPainel)        

        UI.Button("LigarTargetName", function() 
          sayChannel(0,'.55 ligartarget') 
        end, onPainel)

        UI.Button("DesligarTargetName", function() 
          sayChannel(0,'.55 desligartarget') 
        end, onPainel)

        UI.Button("Reset Target", function() 
          sayChannel(0,'.55 resetarTarget') 
        end, onPainel)

        UI.Button("Follow", function() 
          sayChannel(0,'follow on') 
        end, onPainel)

        UI.Button("UnFollow", function() 
          sayChannel(0,'follow off') 
        end, onPainel)
    
        UI.Button("EnemyOn", function() 
          sayChannel(0,'.55 enemyOn') 
        end, onPainel)

        UI.Button("EnemyOff", function() 
          sayChannel(0,'.55 enemyOff') 
        end, offPainel)

        UI.Button("ChicleteOn", function() 
            sayChannel(0,'.55 ChicleteOn')
        end, onPainel)

        UI.Button("ChicleteOff", function() 
            sayChannel(0,'.55 ChicleteOFF')
        end, onPainel)

        UI.Button("BackGGN", function() 
          sayChannel(0,'.55 voltarggn') 
        end, onPainel)

        UI.Button("OffBackGGN", function() 
          sayChannel(0,'.55 offvoltarggn') 
        end, offPainel)     

        UI.Button("Pvp on", function() 
          sayChannel(0,'.55 pvp on') 
        end, onPainel)

        UI.Button("Pvp off", function() 
          sayChannel(0,'.55 pvp off') 
        end, offPainel)

        UI.Button("FirstRush", function() 
          talkPrivate(storage.Tanker, '.55 firstrush') 
        end, onPainel)

        UI.Button("AbortFirstRush", function() 
          sayChannel(0,'.55 abortrush') 
        end, offPainel)


TempleSpawn = function()
if (posx() >= 1020 and posx() <= 1032) and (posy() >= 906 and posy() <= 914) and posz() == 5 then
    return true
else
    return false
end
end

GGNBoat = function()
if (posx() >= 1936 and posx() <= 1959) and (posy() >= 1070 and posy() <= 1089) and posz() == 6 then
    return true
else
    return false
end
end

        voltarggn = macro(200, 'ggnback', function()
            if posz() == 7 then return end
            if TempleSpawn() then
                player:autoWalk(sqmtptemplo, 1, {ignoreNonPathable = true, precision = 0})
            elseif GGNBoat() then
                player:autoWalk(sqmbarco, 1, {ignoreNonPathable = true, precision = 0})
                schedule(3000, function()
                    if geradoresquerda.isOn() then
                        player:autoWalk(SqmCristalEsquerda, 1, {ignoreNonPathable = true, precision = 0})
                    elseif geradordireita.isOn() then
                        player:autoWalk(SqmCristalEsquerda, 1, {ignoreNonPathable = true, precision = 0})
                    end
                end)
            end
        end,MacrosPainel)

        delaycontrol = now
        macro(1, 'mccontrol', function()
            if delaycontrol > now then return end
            if modules.corelib.g_keyboard.areKeysPressed('Alt') and modules.corelib.g_keyboard.areKeysPressed('0') then
                tile = getTileUnderCursor()
                    if tile then
                    tilepos = tile:getPosition()
                    sayChannel(0, 'Agroup X: ' .. tilepos.x .. ', Y: ' .. tilepos.y .. ', Z: ' .. tilepos.z)
                    delaycontrol = now + 1000       
                end
            end
        end,MacrosPainel)

        macro(1, 'RushControl', function()
            if delaycontrol > now then return end
            if modules.corelib.g_keyboard.areKeysPressed('Alt') and modules.corelib.g_keyboard.areKeysPressed('9') then
                tile = getTileUnderCursor()
                    if tile then
                    tilepos = tile:getPosition()
                    sayChannel(0, 'FirstRush X: ' .. tilepos.x .. ', Y: ' .. tilepos.y .. ', Z: ' .. tilepos.z)
                    delaycontrol = now + 1000       
                end
            end
        end,MacrosPainel)

        atknamespain = macro(200, 'Attack By Name', function()
            for _, creature in ipairs(getSpectators(posz())) do
                if target then
                    if g_game.isAttacking() and target == g_game.getAttackingCreature():getName() then return end
                    if creature:getName() == target then
                    g_game.attack(creature)
                    end
                end
            end
        end,MacrosPainel)
        geradoresquerda = macro(200, 'Cristal Esquerda',function()end,MacrosPainel)
        geradordireita = macro(200, 'Cristal direita',function()end,MacrosPainel)
        firstrush = macro(200, 'FirstRush',function()end,MacrosPainel)

        local friendList = {'toei', 'ryan', 'darknuss', ''}

        --- nao editar nada abaixo disso

        for index, friendName in ipairs(friendList) do
             friendList[friendName:lower():trim()] = true
            friendList[index] = nil
        end


    chicleteGGN = macro(1, "Chicletinho 100%", function()
        if isInPz() then return end

    for _,pla in ipairs(getSpectators(posz())) do

        attacked = g_game.getAttackingCreature()

        if not attacked or attacked:isMonster() or attacked:isPlayer() and pla:getHealthPercent() < attacked:getHealthPercent()*0.6 then
            if pla:isPlayer() and pla:getHealthPercent() < 100 and pla:getEmblem() ~= 1 and pla:getSkull() <= 3 then 
                g_game.attack(pla)
            end
        end

    end

    delay(300)

end,MacrosPainel)

local friendList = {'toei', 'ryan', 'darknuss', ''}

--- nao editar nada abaixo disso

for index, friendName in ipairs(friendList) do
     friendList[friendName:lower():trim()] = true
    friendList[index] = nil
end


        enemyggn = macro(1, 'FullEnemyGGN', function()
            if isInPz() then return end
  local possibleTarget = false
  for _, creature in ipairs(getSpectators(posz())) do
    local specHP = creature:getHealthPercent()
    if creature:isPlayer() and specHP then
      if not friendList[creature:getName():lower()] and creature:getEmblem() ~= 1 then
        if creature:canShoot() then
          if not possibleTarget or possibleTargetHP > specHP or (possibleTargetHP == specHP and possibleTarget:getId() < creature:getId()) then
            possibleTarget = creature
            possibleTargetHP = possibleTarget:getHealthPercent()
          end
        end
      end
    end
  end
  if possibleTarget and g_game.getAttackingCreature() ~= possibleTarget then
    g_game.attack(possibleTarget)
    delay(300)
end
end,MacrosPainel)


    end

    McControlWindows.closeButton.onClick = function(widget)
        McControlWindows:hide()
    end

    ui.editspell.onClick = function(widget)
        McControlWindows:show()
        McControlWindows:raise()
        McControlWindows:focus()
    end
end


UI.TextEdit(storage.Tanker or "McKevin", function(widget, newText)
storage.Tanker = newText
end)


UI.TextEdit(storage.lider or "Madamada", function(widget, newText)
storage.lider = newText
end)

onTalk(function(name, level, mode, text, channelId, pos)
    if name == player:getName() then return end
    if channelId == 0 and name == storage.lider then
        local x, y, z = string.match(text, "Agroup X:%s*(%d+),%s*Y:%s*(%d+),%s*Z:%s*(%d+)")
        if x and y and z then
            destPos = {x = tonumber(x), y = tonumber(y), z = tonumber(z)}
            info("Destino: " .. x .. "," .. y .. "," .. z)
        end
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    if firstrush.isOff() or name == player:getName() then return end
    if channelId == 0 and name == storage.lider then
        local x, y, z = string.match(text, "FirstRush X:%s*(%d+),%s*Y:%s*(%d+),%s*Z:%s*(%d+)")
        if x and y and z then
            RushDestPos = {x = tonumber(x), y = tonumber(y), z = tonumber(z)}
            info("Destino: " .. x .. "," .. y .. "," .. z)
        end
    end
end)

macro(1000, function()
    if RushDestPos then
        local pos = player:getPosition()
        local distance = getDistanceBetween(pos, RushDestPos)

        -- Se estiver a até 3 SQMs de distância, considera que chegou
        if distance <= 1 then
            RushDestPos = nil
            return
        end

        -- Continua tentando andar até o destino
        player:autoWalk(RushDestPos, 1, {ignoreNonPathable = true, precision = 1})
        info('walking')
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    if text:find('Stop') then
        destPos = nil
    end
end)

macro(1000, function()
    if destPos then
        local pos = player:getPosition()
        local distance = getDistanceBetween(pos, destPos)

        -- Se estiver a até 3 SQMs de distância, considera que chegou
        if distance <= 4 then
            destPos = nil
            return
        end

        -- Continua tentando andar até o destino
        player:autoWalk(destPos, 1, {ignoreNonPathable = true, precision = 1})
        info('walking')
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    if text == ('.55 useImortal') then
        say('Jujutsu Shiji Hyoketsu')
        say('kawarimi no jutsu defensive')
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    if text == ('.55 firstrush') then
        firstrush.setOn()
    end
    if text == ('.55 abortrush') then
        firstrush.setOff()
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    if text == ('.55 enemyOn') then
        enemyggn.setOn()
    end
    if text == ('.55 enemyOff') then
        enemyggn.setOff()
    end
    if text == '.55 ChicleteOn' then
        chicleteGGN.setOn()
    end
    if text == '.55 ChicleteOFF' then
        chicleteGGN.setOff()
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    if name == storage.lider then
        if text == ('.55 pvp on') then
            say('!pvp on')
        elseif text == ('.55 pvp off') then
            say('!pvp off')
        end
    end
end)


onTalk(function(name, level, mode, text, channelId, pos)
    if text == ('.55 voltarggn') then
        voltarggn.setOn()
    end
    if text == ('.55 offvoltarggn') then
        voltarggn.setOff()
    end
end)

sqmtptemplo = {x = 1026,y = 914, z = 5}
sqmbarco = {x = 1948,y = 1071, z = 6}
SqmCristalEsquerda = {x = 1912, y = 867,z = 7}
SqmCristalDireita = {x=2073,y=932,z=7}


onTalk(function(name, level, mode, text, channelId, pos)
    if text == ('.55 voltar direita') then
        geradoresquerda.setOff()
        geradordireita.setOn()
    end
    if text == ('.55 voltar esquerda') then
        geradoresquerda.setOn()
        geradordireita.setOff()
    end
    if text == '.55 wait ponte' then
        geradoresquerda.setOff()
        geradordireita.setOff()
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    local playerName = player:getName()

    -- Tenta capturar: senha, nome e direção
    local senha, matchName, direction = text:match("^(%d+)%s+(%w+)%s+Ande%s+(%a+)$")

    -- Verifica se tudo foi capturado corretamente e se os dados batem
    if senha == "55" and matchName == playerName and direction then
        local pos = player:getPosition()
        local newPos = {x = pos.x, y = pos.y, z = pos.z}

        direction = direction:lower()

        if direction == "north" then
            newPos.y = newPos.y - 1
        elseif direction == "sul" then
            newPos.y = newPos.y + 1
        elseif direction == "direita" then
            newPos.x = newPos.x + 1
        elseif direction == "esquerda" then
            newPos.x = newPos.x - 1
        else
            return -- Direção inválida
        end

        player:autoWalk(newPos, 0)
    end
end)

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


onTalk(function(name, level, mode, text, channelId, pos)
  if name == player:getName() then return end
  activetext = text:find('Attack: ')
    if activetext then
        target = text:sub(activetext+8)
        info(target)
    end
end)



onTalk(function(name, level, mode, text, channelId, pos)
    if text:find('.55 resetarTarget') then
        g_game.cancelAttack()
    end
end)
onTalk(function(name, level, mode, text, channelId, pos)
    if text:find('follow on') then
        g_game.setChaseMode(1)
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    if text:find('follow off') then
        g_game.setChaseMode(0)
    end
end)

travel = function(city)
NPC.say('hi')
schedule(600, function()
NPC.say(city)
end)
schedule(1200, function()
NPC.say('yes')
end)
end

onTalk(function(name, level, mode, text, channelId, pos)
    if text == ('.55 ligartarget') then
        atknamespain.setOn()
    end
    if text == ('.55 desligartarget') then
        atknamespain.setOff()
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    activetravel = text:find('!travel: ')
    if activetravel then
        destination = text:sub(activetravel)
        travel(destination)
    end
end)


macro(1, function()
if player:getShield() > 0 then return end
for _,PT in ipairs(getSpectators(posz())) do
if PT:getEmblem() == 1 and PT:getShield() > 0 then 
 return g_game.partyJoin(PT:getId())
end

end

delay(100)

end)