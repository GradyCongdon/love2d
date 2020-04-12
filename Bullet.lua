require 'drawing'
require 'position'

--class
Bullet = {
  radius = 1,
  r = 1,
  g = 0,
  b = 0,
  a = 0,  
}


-- table

bullets = {}

function bullets_draw(bullets)
  pushColor()
  for i,bullet in ipairs(bullets) do
    bullet_draw(bullet)
  end
  popColor()
end

function bullets_update(bullets, dt)
  for i,bullet in ipairs(bullets) do
    bullet_update(bullet, dt)
  end
end



-- object
function bullet_create(entity)
  b = {
    x = center(entity).x,
    y = center(entity).y,
    velocity = 250 + entity.velocity,
    angle = entity.angle,
  }
  print(b.angle, entity.angle)

  b.id = #bullets
  table.insert(bullets, b)
end

function bullet_update(b, dt)
  radians = math.rad(b.angle)
  b.x = b.x + (b.velocity * math.cos(radians)) * dt
  b.y = b.y + (b.velocity * math.sin(radians)) * dt
end

function bullet_draw(b)
  love.graphics.setColor(Bullet.r, Bullet.g, Bullet.b)
  love.graphics.circle('line', b.x, b.y, Bullet.radius)
end

function bullet_destory(b)
  table.remove(bullets, b.id)
end
