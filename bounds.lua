require 'position'
-- bounds 

function contained(entity, container)
  if entity.x + entity.width > container.width then
    return "right"
  elseif entity.y + entity.height > container.height  then
    return "bottom"
  elseif entity.x < container.x  then
    return "left"
  elseif entity.y < container.y  then
    return "top"
  end
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
