function love.load()
    bullet= love.graphics.newImage("bullet.png")
    x = 0 
    y = 100
    w = love.graphics.getWidth()
    h= love.graphics.getHeight()
end


function love.update(dt)
    x = x + 200 * dt

end


function love.draw()
    love.graphics.setBackgroundColor(0,138/255,197/255)
    love.graphics.draw(bullet,w/2,h/2,0,1,1, bullet:getWidth()/2,bullet:getHeight()/2)
end
