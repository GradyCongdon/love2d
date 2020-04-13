require 'position'
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
  return nil
end

function collision(a, b)
  if right(a) > left(b) then return 'right' end
  if left(a) < right(b) then return 'left' end
  if bottom(a) > top(b) then return 'bottom' end
  if top(a) < bottom(b) then return 'top' end
  return nil
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
