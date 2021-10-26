Enemy = Class{}

function Enemy:init(world, sprite, x, y)
    self.sprite = sprite
    self.w = self.sprite:getWidth()
    self.h = self.sprite:getHeight()
    self.body = world:newRectangleCollider(x, y, self.w, self.h, {collision_class='Enemy'})
    
end

function Enemy:update(dt)
    
end

function Enemy:draw()
    love.graphics.draw(self.sprite, self.body:getX()-self.w/2,
                        self.body:getY()-self.h/2)
end