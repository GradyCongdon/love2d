Player = {
  name = "Player"

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
