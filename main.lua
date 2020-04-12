require 'position'
require 'bounds'
require 'movement'

require 'Bullet'

function love.conf(t)
	t.console = true
end 

function love.load()
  love.window.setPosition(0,0,1)

  -- load 
  window = {
    x = 0,
    y = 0,
    width = love.graphics.getWidth(),
    height = love.graphics.getHeight(),
  }

  player = {
    x = 100,
    y = 10,
    width = 30,
    height = 10,

    velocity = 500,
    angle = 0,
  }


  title = {
    x = 400,
    y = 300,
    width = 0,
    height = 0,

    text = "Hello, love",
  }

  log = {}
  count = {}

end

function love.update(dt)
  move(player, dt)
  collisionType = contained(player, window)
  xx_delta('collisionType', collisionType)
  if collisionType then
    limitTo(player, window, collisionType)
  end
  bullets_update(bullets, dt)
end

-- actions

function love.keypressed(key)
  if key == 'space' then
    bullet_create(player)
  end
   if key == "`" then
      debug.debug()
   end
end


-- draw

function love.draw()
  window_draw(window)
  text_draw(title)
  player_draw(player)
  bullets_draw(bullets)

  xx_direction(player)
  xx_direction(bullets[1])
  game_fps()
end

function window_draw(window)
  love.graphics.rectangle('line', window.x, window.y, window.width, window.height)
end

function text_draw(text)
  love.graphics.print(text.text, text.x, text.y)
end

function player_draw(player)
  love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)
  r,g,b,a = love.graphics.getColor()
  love.graphics.setColor(r,g,b,a)
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
