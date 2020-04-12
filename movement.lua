-- movement

function move(entity, dt)
  if love.keyboard.isDown('up') then
    entity.y = entity.y - entity.velocity * dt
    entity.angle = 270 
  elseif love.keyboard.isDown('down') then
    entity.y = entity.y + entity.velocity * dt
    entity.angle = 90
  elseif love.keyboard.isDown('right') then
    entity.x = entity.x + entity.velocity * dt
    entity.angle = 0
  elseif love.keyboard.isDown('left') then
    entity.x = entity.x - entity.velocity * dt
    entity.angle = 180 
  end
end
