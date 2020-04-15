Player = {
  name = "Player",
  traits = {
    moveable = true,
    collidable = true,
  }

}
Player.__index = Player
function Player:new(x, y)
  local player = {
    x = x,
    y = y,
    width = 30,
    height = 10,

    velocity = 500,
    angle = 0,

    collision = {}
  }
  setmetatable(player, Player)
  return player
end

function Player:update(dt)
end


function Player:draw()
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
  love.graphics.print('player', self.x, top(self) - 15)
end


require 'position'
function debugCollision()
  if self.collision then
    if self.collision.right then
      love.graphics.print('r', right(self) + 5, center(self).y)
    end
    if self.collision.right then
      love.graphics.print('l', left(self) - 15, center(self).y)
    end
    if self.collision.right then
      love.graphics.print('t', center(self).x , top(self) - 15)
    end
    if self.collision.right then
      love.graphics.print('b', center(self).x , bottom(self) + 15)
    end
  end
end
