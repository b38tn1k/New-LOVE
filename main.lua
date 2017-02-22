--UTILS
require "utils.colors" require "utils.events"
--CLASSES
assets = require('classes.cargo').init('assets')
JSON = (loadfile "classes/JSON.lua")()
--VARS
local lg = love.graphics
game = {}
game.pause = true
game.debug = false
game.time = 0
game.dims = {}

function love.load()
  game.dims.x = lg.getWidth()
  game.dims.y = lg.getHeight()
  --JUNK BELOW
  lg.setBackgroundColor(colors.orange)
  delta = 0
end

function love.update(dt)
  game.time = game.time + dt
  --JUNK BELOW
  x = game.dims.x/2 - assets.princessPixel:getWidth()/2
  y = game.dims.y/2 - assets.princessPixel:getHeight()/2
end

function love.draw()
  --JUNK BELOW
  if game.debug == true then
    lg.print("FPS: "..love.timer.getFPS(), 10, 10)
  end
  lg.draw(assets.princessPixel, x + 10*math.sin(game.time), y + 10*math.sin(game.time))
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
