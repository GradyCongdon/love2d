
Window = {
  name = "Window"

}
Window.__index = Window
function Window:new()
  local window  = {
    x = 0,
    y = 0,
    width = love.graphics.getWidth(),
    height = love.graphics.getHeight(),
  }
  setmetatable(window, Windwo)
  return window
end

function Window:update(dt)

end

function Window:draw()
  love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end
