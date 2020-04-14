

function right(entity) 
  return entity.x + entity.width
end

function setRight(entity, value)
  print('right', value)
  entity.x = value - entity.width
  return entity.x
end


function left(entity) 
  return entity.x
end

function setLeft(entity, value)
  entity.x = value
  return entity.x
end


function top(entity) 
  return entity.y
end

function setTop(entity, value)
  print('top', value)
  entity.y = value
  return entity.y
end


function bottom(entity) 
  return entity.y + entity.height
end

function setBottom(entity, value)
  entity.y = value - entity.height
  return entity.y
end

function center(entity)
  return {
    x = entity.x + (entity.width / 2),
    y = entity.y + (entity.height / 2)
  }
end


function setPositionTo(entityFrom, entityTo)
  entityFrom.x = entityTo.x
  entityFrom.y = entityTo.y
end

