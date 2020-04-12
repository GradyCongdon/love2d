
colors = {}

function pushColor()
  r,g,b,a = love.graphics.getColor()
  color = {
    r = r,
    g = g,
    b = b,
    a = a,
  }
  table.insert(colors, color)
end

function popColor()
  color = table.remove(colors)
  love.graphics.setColor(color.r, color.g, color.b, color.a)
end

