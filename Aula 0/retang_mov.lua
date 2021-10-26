function love.load()
    x = 0
end

function love.update(dt)
    x = x + 120 * dt
end

function love.draw()
    love.graphics.rectangle("fill",x,50,40,20)
end