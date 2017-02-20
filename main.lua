require "classes.colors" require "classes.events"
assets = require('classes.cargo').init('assets')
JSON = (loadfile "classes/JSON.lua")()
local lg = love.graphics
game = {}

function love.load()
  game.pause = true
  game.debug = false
  game.time = 0
  --JUNK BELOW
  lg.setBackgroundColor(orange)
  x = lg.getWidth()/2 - assets.princessPixel:getWidth()/2
  y = lg.getHeight()/2 - assets.princessPixel:getHeight()/2
  delta = 0
end

function love.update(dt)
  game.time = game.time + dt
  --JUNK BELOW
  delta = math.sin(1000 * game.time)
end

function love.draw()
  --JUNK BELOW
  lg.draw(assets.princessPixel, x + delta, y + delta)
end

function save(table, fileName)
  local jsonText = JSON:encode(table)
  local saveFile = io.open(fileName, "w")
  saveFile:write(jsonText)
  saveFile:close()
end

function load(fileName)
  local saveFile = io.open(fileName, "r")
  local jsonText = saveFile:read()
  local loadedTable = JSON:decode(jsonText)
  return loadedTable
end
