require 'position'
require 'drawing'
require 'bounds'
require 'movement'

require 'Player'
require 'Window'
require 'Wall'

require 'Bullet'

function love.conf(t)
	t.console = true
end 

function love.load()
  love.window.setPosition(0,0,1)

  -- load 
  window = Window:new()
  windowCenter = center(window)
  player = Player:new(windowCenter.x, windowCenter.y)
  bullets = {}

  walls = {
    Wall:new(100,300,5, 100),
  }



  title = {
    x = 400,
    y = 300,
    width = 0,
    height = 0,

    text = "Hello, love",
  }

  drawables = {
    window,
    player,
    bullets,
    walls,
    title
  }

  updateables = {
    window,
    player,
    bullets,
    walls,
    title
  }

  moveables = {
    player,
    --bullets
  }

  containables = {
    window
  }

  collidables = {
    walls,
  }


  log = {}
  count = {}

end



function love.update(dt)
  for i,x in ipairs(updateables) do
    if #x == 0 and x.name then
      x:update(dt)
    else 
      for j,y in ipairs(x) do
        y:update(dt)
      end
    end
  end

  for i,x in ipairs(moveables) do
    if #x == 0 and x.name then
      move(x, dt)
      collide_each(collidables, x)
    else 
      for j,y in ipairs(x) do
        move(y, dt)
        collide_each(collidables, y)
      end
    end
  end

end

function collide_each(targets, a)
  for i,b in ipairs(targets) do
    if #b == 0 and b.name then
      collide(a, b)
    else 
      for j,c in ipairs(b) do
        collide(a,c)
      end
    end
  end
end

function love.draw()
  for i,x in ipairs(drawables) do
    xType = type(x)
    if #x == 0 and x.name then
      pushColor()
      x:draw()
      popColor()
    else 
      pushColor()
      for j,y in ipairs(x) do
        y:draw()
      end
      popColor()
    end
  end
  game_fps()
end

function love.keypressed(key)
  if key == 'space' or key == 'l' then
    b = Bullet:new(player)
    table.insert(bullets, b)
  end
   if key == "`" then
      debug.debug()
   end
end


function text_draw(text)
  love.graphics.print(text.text, text.x, text.y)
end

-- xebug

function count_on(key, mod)
  val = tonumber((count[key] or 0))
  count[key] = val + 1
  return count[key] % mod == 0
end

function xx_position(entity)
  if count_on('position', 100) then
    print("x:"..round(entity.x, 1).." y:"..round(entity.y, 1))
  end
end

function xx_direction(entity)
  if count_on('angle', 100) then
    print("deg:"..(entity and entity.angle or 'nil'))
  end
end

function xx_size(entity)
  print("w:"..entity.width.." h:"..entity.height)
end

function xx_delta(key, new) 
  current = log[key]
  if new ~= current then
    print(key..': '..(current or 'nil')..' -> '..(new or 'nil'))
  end
  log[key] = new
  return new
end


-- util
function round(num, numDecimalPlaces)
  return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function game_fps()
  love.graphics.print("fps: "..tostring(love.timer.getFPS( )), 10, 10)
end

function uu()
  for i,x in ipairs(updateable) do
    if type(x) == 'table' then
      for j,y in ipairs(x) do
        y.update(dt)
      end
    else
      x.update(dt)
    end
  end
end

function update_walls()
  for i, wall in ipairs(walls) do
    collisionType = collision(player, wall)
    if collisionType then
      limitTo(player, wall, collisionType)
    end
  end
end
