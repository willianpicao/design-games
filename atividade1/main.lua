function love.load()
    bullet= love.graphics.newImage("bullet.png")
    x = 0 
    dx= 400 --vel da bala
    w = love.graphics.getWidth()
    h= love.graphics.getHeight()
    aux = -1
    xx = w - bullet:getWidth()

end


function love.update(dt)
    if x >= w then
        aux= aux * (-1)
        dx= dx * (-1)
        if x ~= xx then
            x = xx
        end
    end
    x= x + dx * dt
end


function love.draw()

    love.graphics.setBackgroundColor(0,138/255,197/255)
    love.graphics.draw(bullet, x, h/2, 0, aux, 1,nil,bullet:getHeight()/2)
end
