
Wall = {
    name = 'Wall',
    r = .25,
    g = .25,
    b = .25,
    a = 1,
    mode = 'fill',
}
Wall.__index = Wall

function Wall:new(x,y,width,height)
  local wall = {
    x = x,
    y = y,
    width = width,
    height = height,
  }
  setmetatable(wall, Wall)
  return wall
end

function Wall:update(dt)

end

function Wall:draw()
  love.graphics.rectangle(Wall.mode, self.x, self.y, self.width, self.height)
end
