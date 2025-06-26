setDefaultTab("War")


-- Tools UI (Activate & Setup);
enemybotPanelName = "enemybot"

local ui = setupUI([[
Panel
  height: 17
  BotSwitch
    id: title
    anchors.top: parent.top
    anchors.left: parent.left
    text-align: center
    width: 130
    !text: tr('Enemy')

  Button
    id: settings
    anchors.top: prev.top
    anchors.left: prev.right
    anchors.right: parent.right
    margin-left: 3
    height: 17
    text: Setup
]])
ui:setId(enemybotPanelName);

local windowUI = setupUI([[
MainWindow
  !text: tr('Enemy by neoX - VictorNeox#4112')
  size: 408 475
  id: MainPanel

  Label
    anchors.right: FriendList.right
    anchors.top: parent.top
    anchors.left: FriendList.left
    text-align: center
    text: Friend List
    margin-left: 3   

  TextList
    id: FriendList
    anchors.top: parent.top
    anchors.left: parent.left
    margin-top: 15
    margin-bottom: 5
    margin-right: 3
    padding: 1
    width: 180
    height: 160
    vertical-scrollbar: FriendListScrollBar

  VerticalScrollBar
    id: FriendListScrollBar
    anchors.top: FriendList.top
    anchors.bottom: FriendList.bottom
    anchors.right: FriendList.right
    step: 14
    pixels-scroll: true

  TextEdit
    id: FriendName
    anchors.right: FriendList.right
    anchors.left: FriendList.left
    anchors.top: FriendList.bottom
    margin-right: 3    
    margin-top: 5

  Button
    id: AddFriend
    !text: tr('Add Friend')
    anchors.right: FriendList.right
    anchors.left: FriendList.left
    anchors.top: prev.bottom
    margin-right: 3    
    margin-top: 3

  Label
    anchors.right: EnemyList.right
    anchors.top: parent.top
    anchors.left: EnemyList.left
    text-align: center
    text: Enemy List
    margin-left: 3     

  TextList
    id: EnemyList
    anchors.top: parent.top
    anchors.left: FriendList.right
    margin-top: 15
    margin-bottom: 5
    margin-left: 15
    padding: 1
    width: 180
    height: 160
    vertical-scrollbar: EnemyListScrollBar

  VerticalScrollBar
    id: EnemyListScrollBar
    anchors.top: EnemyList.top
    anchors.bottom: EnemyList.bottom
    anchors.right: EnemyList.right
    step: 14
    pixels-scroll: true

  TextEdit
    id: EnemyName
    anchors.left: EnemyList.left
    anchors.right: EnemyList.right
    anchors.top: EnemyList.bottom
    margin-left: 3    
    margin-top: 5

  Button
    id: AddEnemy
    !text: tr('Add Enemy')
    anchors.left: EnemyList.left
    anchors.right: EnemyList.right
    anchors.top: prev.bottom
    margin-left: 3    
    margin-top: 3

  HorizontalSeparator
    id: separator
    anchors.top: AddEnemy.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8  

  Label
    id: prioritiesLabel
    anchors.top: separator.bottom
    anchors.left: parent.left
    text-align: center
    text: Priorities
    margin-top: 8
    margin-left: 60

  HorizontalScrollBar
    id: distance
    anchors.left: parent.left
    anchors.horizontalCenter: prioritiesLabel.horizontalCenter
    anchors.top: prioritiesLabel.bottom
    width: 125
    margin-top: 8
    minimum: 1
    maximum: 9
    step: 1
    margin-top: 40

  Label
    id: distanceLabel
    anchors.bottom: distance.top
    anchors.horizontalCenter: distance.horizontalCenter
    text-align: center
    text: Minimum Distance
    margin-bottom: 8

  Label
    id: distanceCountLabel
    anchors.horizontalCenter: distance.horizontalCenter
    anchors.top: distance.bottom
    text: 1
    width: 10
    margin-top: 5

  HorizontalSeparator
    id: secondHoSeparator
    anchors.top: distanceCountLabel.bottom
    anchors.left: distance.left
    anchors.right: distance.right
    margin-top: 8 

  HorizontalScrollBar
    id: minimumHp
    anchors.left: distance.left
    anchors.top: distanceCountLabel.bottom
    width: 125
    margin-top: 8
    minimum: 1
    maximum: 100
    step: 1
    margin-top: 40

  Label
    id: minimumHpLabel
    anchors.bottom: minimumHp.top
    anchors.horizontalCenter: minimumHp.horizontalCenter
    text-align: center
    width: 125
    text: Minimum HP
    margin-bottom: 8
    
  Label
    id: minimumHpCountLabel
    anchors.horizontalCenter: minimumHp.horizontalCenter
    anchors.top: minimumHp.bottom
    anchors.verticalCenter: minimumHp.verticalCenter
    text: 1%
    width: 35
    margin-top: 20
    margin-left: 8

  VerticalSeparator
    id: vertSeparator
    anchors.top: separator.bottom
    anchors.bottom: parent.bottom
    anchors.left: secondHoSeparator.right
    margin-left: 40
    margin-bottom: 5

  Label
    id: activatableLabel
    anchors.top: separator.bottom
    anchors.left: vertSeparator.left
    text-align: center
    text: Activatable
    margin-top: 8
    margin-left: 60

  BotSwitch
    id: AttackNotFriends    
    anchors.top: activatableLabel.bottom
    anchors.horizontalCenter: activatableLabel.horizontalCenter
    width: 135
    text-align: center
    text: Attack Not Friends
    margin-top: 25

  BotSwitch
    id: AttackWhite    
    anchors.top: prev.bottom
    anchors.horizontalCenter: activatableLabel.horizontalCenter
    width: 135
    margin-top: 8
    text-align: center
    text: Attack White Skull

  BotSwitch
    id: AttackYellow    
    anchors.top: prev.bottom
    anchors.horizontalCenter: activatableLabel.horizontalCenter
    width: 135
    margin-top: 8
    text-align: center
    text: Attack Yellow Skull

  BotSwitch
    id: AttackParty    
    anchors.top: prev.bottom
    anchors.horizontalCenter: activatableLabel.horizontalCenter
    width: 135
    margin-top: 8
    text-align: center
    text: Attack Party  

  BotSwitch
    id: AttackGuild    
    anchors.top: prev.bottom
    anchors.horizontalCenter: activatableLabel.horizontalCenter
    width: 135
    margin-top: 8
    text-align: center
    text: Attack Guild

  Button
    id: closeButton
    !text: tr('Close')
    font: cipsoftFont
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    size: 45 21
    margin-top: 15
    margin-right: 5 

]], g_ui.getRootWidget());

windowUI:hide();
local configName = modules.game_bot.contentsPanel.config:getCurrentOption().text;
EnemyBotConfig = {
    enemies = {},
    friends = {},
    minimumDistance = 1,
    minimumHp = 1,
    enabled = false,
    attackNotFriends = false,
    attackParty = false,
    attackGuild = false,
};

EnemyBot = {};

local MAIN_DIRECTORY = "/bot/" .. configName .. "/" .. "neox_enemybot/";
if not g_resources.directoryExists(MAIN_DIRECTORY) then
  g_resources.makeDir(MAIN_DIRECTORY);
end

local enemyBotFile = "" .. MAIN_DIRECTORY .. "enemybot_config" .. ".json";
local MainPanel = windowUI

ConfigNeox.read(enemyBotFile, function(result)
  EnemyBotConfig = result
  if (type(EnemyBotConfig.enemies) ~= 'table') then
      EnemyBotConfig.enemies = {};
  end
  if (type(EnemyBotConfig.friends) ~= 'table') then
      EnemyBotConfig.friends = {};
  end
end);

function EnemyBot.save()
  ConfigNeox.save(enemyBotFile, EnemyBotConfig);
end

ui.title:setOn(EnemyBotConfig.enabled);
ui.title.onClick = function(widget)
  EnemyBotConfig.enabled = not EnemyBotConfig.enabled;
  widget:setOn(EnemyBotConfig.enabled);
  EnemyBot.save();
end

ui.settings.onClick = function(widget)
  windowUI:show();
  windowUI:raise();
  windowUI:focus();
end

windowUI.closeButton.onClick = function(widget)
  windowUI:hide();
  EnemyBot.save();
end

MainPanel.AttackNotFriends:setOn(EnemyBotConfig.attackNotFriends);
MainPanel.AttackNotFriends.onClick = function(widget)
  EnemyBotConfig.attackNotFriends = not EnemyBotConfig.attackNotFriends;
  widget:setOn(EnemyBotConfig.attackNotFriends);
  EnemyBot.save();
end

MainPanel.AttackWhite:setOn(EnemyBotConfig.attackWhite);
MainPanel.AttackWhite.onClick = function(widget)
  EnemyBotConfig.attackWhite = not EnemyBotConfig.attackWhite;
  widget:setOn(EnemyBotConfig.attackWhite);
  EnemyBot.save();
end

MainPanel.AttackYellow:setOn(EnemyBotConfig.attackYellow);
MainPanel.AttackYellow.onClick = function(widget)
  EnemyBotConfig.attackYellow = not EnemyBotConfig.attackYellow;
  widget:setOn(EnemyBotConfig.attackYellow);
  EnemyBot.save();
end

MainPanel.AttackGuild:setOn(EnemyBotConfig.attackGuild);
MainPanel.AttackGuild.onClick = function(widget)
  EnemyBotConfig.attackGuild = not EnemyBotConfig.attackGuild;
  widget:setOn(EnemyBotConfig.attackGuild);
  EnemyBot.save();
end

MainPanel.AttackParty:setOn(EnemyBotConfig.attackParty);
MainPanel.AttackParty.onClick = function(widget)
  EnemyBotConfig.attackParty = not EnemyBotConfig.attackParty;
  widget:setOn(EnemyBotConfig.attackParty);
  EnemyBot.save();
end

MainPanel.distance:setValue(EnemyBotConfig.minimumDistance);
MainPanel.distanceCountLabel:setText(EnemyBotConfig.minimumDistance);
MainPanel.distance.onValueChange = function(scroll, value)
  EnemyBotConfig.minimumDistance = value;
  MainPanel.distanceCountLabel:setText(value);
  EnemyBot.save();
end

MainPanel.minimumHp:setValue(EnemyBotConfig.minimumHp);
MainPanel.minimumHpCountLabel:setText(EnemyBotConfig.minimumHp .. '%');
MainPanel.minimumHp.onValueChange = function(scroll, value)
  EnemyBotConfig.minimumHp = value;
  MainPanel.minimumHpCountLabel:setText(value .. '%');
  EnemyBot.save();
end

function EnemyBot.getListChildren(type) 
  return (type == 'enemies') and MainPanel.EnemyList:getChildren() or MainPanel.FriendList:getChildren();
end

function EnemyBot.refreshList(type)
  if (type ~= 'enemies' and type ~= 'friends') then return end
  if (EnemyBotConfig[type]) then
    for i, child in pairs(EnemyBot.getListChildren(type)) do
      child:destroy();
    end
    for name, entry in pairs(EnemyBotConfig[type]) do
      local label = nil;
      if (type == 'enemies') then
        label = UI.createWidget('PlayerName', MainPanel.EnemyList);
      else
        label = UI.createWidget('PlayerName', MainPanel.FriendList);
      end
      label.remove.onClick = function(widget)
        EnemyBotConfig[type][name] = nil;
        reindexTable(EnemyBotConfig[type]);
        label:destroy();
        EnemyBot.save();
      end
      label:setText(name);
    end
  end
end

function EnemyBot.fullRefresh()
  EnemyBot.refreshList('enemies');
  EnemyBot.refreshList('friends');
end

MainPanel.AddFriend.onClick = function(widget)
  EnemyBot.addToTheList('friends');
end

MainPanel.AddEnemy.onClick = function(widget)
  EnemyBot.addToTheList('enemies');
end

function EnemyBot.init()
  EnemyBot.fullRefresh();
end

function EnemyBot.addToTheList(type)
  local charName = nil;
  if (type == 'enemies') then
    charName = MainPanel.EnemyName:getText():trim():lower();
  elseif (type == 'friends') then
    charName = MainPanel.FriendName:getText():trim():lower();
  end

  if (not charName or charName:len() == 0) then
    return warn('EnemyBot: Digite um nome válido.');
  end

  EnemyBotConfig[type][charName] = { enabled = true };
  EnemyBot.refreshList(type);
  EnemyBot.save();
end

EnemyBot.init()

function EnemyBot.checkConditions(creature)
  if (creature:getName() == player:getName()) then return false; end
  if (not creature:isPlayer()) then return false; end
  if (not creature:canShoot()) then return false; end
  if (
    getDistanceBetween(pos(), creature:getPosition()) <= EnemyBotConfig.minimumDistance and
    creature:getHealthPercent() <= EnemyBotConfig.minimumHp
  ) then
    if (EnemyBotConfig.enemies[creature:getName():lower()]) then
      return true;
    elseif (EnemyBotConfig.attackWhite and creature:getSkull() == 3 and creature:getShield() ~= 1 and creature:getShield() < 3) then
      return true;
    elseif (EnemyBotConfig.attackYellow and creature:getSkull() == 1 and creature:getShield() ~= 1 and creature:getShield() < 3) then
      return true;
    elseif (EnemyBotConfig.attackNotFriends and not EnemyBotConfig.friends[creature:getName():lower()]) then
      if (not EnemyBotConfig.attackGuild and creature:getEmblem() == 1) then return false; end
      if (not EnemyBotConfig.attackParty and creature:getShield() > 2) then return false; end
      return true;
    elseif (
      (EnemyBotConfig.attackGuild and creature:getShield() == 1) or
      (EnemyBotConfig.attackParty and creature:getShield() >= 3)
    ) then
        return true;
    end
  end
  return false;
end

EnemyBot.lastTry = nil;

EnemyBot.macro = macro(100, function()
  if (not ui.title:isOn()) then return; end
  if (isInPz()) then return end;
  if (EnemyBot.lastTry and EnemyBot.lastTry > now) then return; end
  local currentTarget = g_game.getAttackingCreature();
  local betterPlayerToAttack = nil;
  for i, creature in pairs(getSpectators()) do
    if (EnemyBot.checkConditions(creature)) then
      if (
        (
          betterPlayerToAttack and creature:getHealthPercent() <= betterPlayerToAttack:getHealthPercent() 
        ) or 
        (not betterPlayerToAttack)
      ) then
        betterPlayerToAttack = creature;
      end
    end
  end
  if (betterPlayerToAttack and (not currentTarget or currentTarget:getId() ~= betterPlayerToAttack:getId())) then
    doAttack(betterPlayerToAttack)
    EnemyBot.lastTry = now + 500;
  end
end);

