
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

function collide(a,b)
  if isCollision(a,b) then
    if match('Player', a, 'Wall', b) then halt(a, b, dir) end
    if match('Bullet', a, 'Wall', b) then destroy(a) end
  end
end

function match(aType, a, bType, b)
  aName = a.name;
  bName = b.name;
  return (aName == aType) and (bName == bType)
end

function destroy(a)
  a.destroy = true
end

function halt(a,b,dir)
  dir = getDirection(a.angle)
  if dir == 'right' then
    setRight(a, left(b))
  elseif dir == 'left' then
    setLeft(a, right(b))
  elseif dir == 'up' then
    setTop(a, bottom(b))
  elseif dir == 'down' then
    setBottom(a, top(b))
  end
end
