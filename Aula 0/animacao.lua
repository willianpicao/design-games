function love.load()
    bullet= love.graphics.newImage("bullet.png")
    x = 0 
    y = 100
    dx= 800 --vel da bala
    dy= 200
    w = love.graphics.getWidth()
    h= love.graphics.getHeight()
    xscale=1

end


function love.update(dt)
    if x >= w then
        x = w
        if xscale > 0.5 then
            xscale = xscale - 4 *dt
        else
            y = y + dy * dt
        end
        
    else
        x = x + dx * dt

    end


end


function love.draw()
    love.graphics.setBackgroundColor(0,138/255,197/255)
    love.graphics.draw(bullet, x, y, 0, -xscale, 1)
end
