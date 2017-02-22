-- keep all key, mouse, etc events here
function love.keyreleased(key)
  if key == "escape" then
    game.pause = not game.pause
  end
  if key == 'tab' then
    game.debug = not game.debug
  end
end


function love.resize(w, h)
  game.dims.x = w
  game.dims.y = h
end
