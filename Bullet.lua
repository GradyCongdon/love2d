require 'position'

Bullet = {
    name = 'Bullet',
    r = 1,
    g = 0,
    b = 0,
    a = 0,  

    radius = 1,
}
Bullet.__index = Bullet

function Bullet:new(entity)
  local this = {
    x = center(entity).x,
    y = center(entity).y,
    velocity = 250 + entity.velocity,
    angle = entity.angle,
    width = Bullet.radius * 2,
    height = Bullet.radius * 2,

  }
  setmetatable(this, Bullet)
  return this
end

function Bullet:update(dt)
  if not self.destroy then
    radians = math.rad(self.angle)
    self.x = self.x + (self.velocity * math.cos(radians)) * dt
    self.y = self.y + (self.velocity * math.sin(radians)) * dt
  end
end

function Bullet:draw(b)
  if not self.destroy then
    love.graphics.setColor(self.r, self.g, self.b)
    love.graphics.circle('line', self.x, self.y, self.radius)
  end
end

