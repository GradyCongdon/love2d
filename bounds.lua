require 'position'
require 'direction'

local inspect = require('inspect')
-- bounds 
--
function contain(a, b)
  print('contain',a.name, b.name)
  direction = getContained(a, b)
  if direction ~= 'none' then
    limitTo(a, b, direction)
  end
end

function contained(entity, container)
  if right(entity) > container.width then 
    return "right"
  elseif top(entity) > container.height  then
    return "bottom"
  elseif left(entity) < container.x  then
    return "left"
  elseif bottom(entity) < container.y  then
    return "top"
  end
  return 'none'
end

function xcollide(a, b)
  collision = getCollision(a, b)

  a.collision = {}
  if collision.any == false then
    return
  end
  a.collision = collision
  for k,x in pairs(collision) do
    if x and k ~= any then
      --limitTo(a, b, k)
    end
  end
end

function getCollision(a, b)
  c = {
    any = false,
    right = false,
    left = false,
    top = false,
    bottom = false,
    x = false,
    y = false,
  }
  if right(a) >= left(b) then
    c.right = true
  end
  if left(a) >= right(b) then
    c.left = true
  end
  if bottom(a) >= top(b) then
    c.bottom = true
  end
  if top(a) >= bottom(b) then
    c.top = true
  end

  if (c.right or c.left) 
    and (c.top or c.bottom) then
    c.any = true
  else
    for i,v in ipairs(c) do
      c[i] = false
    end
  end

  return c
end


function limitTo(entity, limiter, direction)
  if direction == "right" then
    setRight(entity, right(limiter))
  elseif direction == "left" then
    setLeft(entity, left(limiter))
  elseif direction == "bottom" then 
    setBottom(entity, bottom(limiter))
  elseif direction == "top" then
    setTop(entity, top(limiter))
  end
end



function x_collision(c)
  print(
  'any = ', c.any,
  'right = ', c.right,
  'left = ', c.left,
  'top = ', c.up,
  'bottom = ', c.down
  )
end

