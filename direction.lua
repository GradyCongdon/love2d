
function getDirection(angle)
  if 0 <= angle and angle < 90 then
    return 'right'
  elseif 90 <= angle and angle < 180 then
    return 'down'
  elseif 180 <= angle and angle < 270 then
    return 'left'
  elseif 270 <= angle and angle < 360 then
    return 'up'
  end
end
