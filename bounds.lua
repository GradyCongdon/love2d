require 'position'

local inspect = require('inspect')
-- bounds 

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
    c.any = true
  end
  if left(a) <= right(b) then
    c.left = true
    c.any = true
  end
  if bottom(a) >= top(b) then
    c.bottom = true
    c.any = true
  end
  if top(a) <= bottom(b) then
    c.top = true
    c.any = true
  end


  return c
end

function isCollision(a,b)
  if right(a) > left(b) and
    left(a) < right(b) and
    bottom(a) > top(b) and
    top(a) < bottom(b) then
    return true
  else
    return false
  end
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

function collide(a, b)
  print('collide',a.name, b.name)
  collision = getCollision(a, b)

  if collision.any == false then
    return
  end
  for k,x in pairs(collision) do
    print(k)
    if x and k ~= any then
      limitTo(a, b, k)
    end
  end
end

function xcollide(a,b)
  print('col?',a.name, b.name)
  if isCollision(a,b) then
    print('col',a.name, b.name)
    limitTo(a, b, 'right')
    limitTo(a, b, 'left')
    limitTo(a, b, 'top')
    limitTo(a, b, 'bottom')
  end
end

function contain(a, b)
  print('contain',a.name, b.name)
  direction = getContained(a, b)
  if direction ~= 'none' then
    limitTo(a, b, direction)
  end
end
