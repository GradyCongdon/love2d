-- movement

function move(entity, dt)
  if love.keyboard.isDown('up') or love.keyboard.isDown('w') then
    entity.y = entity.y - entity.velocity * dt
    entity.angle = 270 
  elseif love.keyboard.isDown('down') or love.keyboard.isDown('s') then
    entity.y = entity.y + entity.velocity * dt
    entity.angle = 90
  elseif love.keyboard.isDown('right') or love.keyboard.isDown('d') then
    entity.x = entity.x + entity.velocity * dt
    entity.angle = 0
  elseif love.keyboard.isDown('left') or love.keyboard.isDown('a') then
    entity.x = entity.x - entity.velocity * dt
    entity.angle = 180 
  end
end
