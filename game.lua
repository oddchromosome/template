local lg = love.graphics
local floor = math.floor

-- turn off filtering!
-- order matters!
lg.setDefaultFilter("nearest", "nearest", 1)
lg.setLineWidth(0.3)

local Game = {board = {}}

function Game:init()
  -- standard sprite size
  self.sprite = 8
  -- board size
  self.board.width = 16
  self.board.height = 12
  -- stretch
  self.screen_scale = 8

  -- set window size
  love.window.setMode(self.board.width * self.sprite * self.screen_scale, self.board.height * self.sprite * self.screen_scale)
end

function Game.pixel_width()
  return Game.board.width * Game.sprite
end

function Game.pixel_height()
  return Game.board.height * Game.sprite
end

function Game.diagonal()
  local w = Game.pixel_width()
  local h = Game.pixel_height()
  return math.sqrt(w*w + h*h)
end

function Game.in_between_width(x)
  return x > 0 and x < Game.pixel_width()
end

function Game.in_between_height(y)
  return y > 0 and y < Game.pixel_height()
end

function Game.on_screen(x,y)
  return Game.in_between_width(x) and Game.in_between_height(y)
end

function Game:get_cell(coordinate)
  return floor(coordinate / self.sprite) + 1
end

function Game:scale()
  -- scale screen
  lg.scale(lg.getWidth() / self.pixel_width(), lg.getHeight() / self.pixel_height())
end

return Game
