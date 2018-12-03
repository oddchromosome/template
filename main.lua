game = require "game"
rect = require "objects/rectangle"
color = require "qualities/color"
move = require "action/move"

sp = nil
local rectangle

function love.load()
  game:init()

  sp = game.sprite
  rectangle = rect.new(sp, sp, sp*2, sp*2, color.blue)
end

function love.update(dt)
  move:standard(rectangle)
end

function love.draw()
  game:scale()

  rectangle:draw()
end

love.keypressed = function(key)
  if key == "escape" then
   love.event.quit()
  end
end
