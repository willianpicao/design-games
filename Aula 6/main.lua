WINDOW_WIDTH = 854
WINDOW_HEIGTH = 480

VIRTUAL_WIDTH = 1600
VIRTUAL_HEIGHT = 800
push = require 'push'

function love.load()
    push: setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,
                      WINDOW_WIDTH,WINDOW_HEIGTH)

    bg = love.graphics.newImage('background.jpg')
    bg_scroll_speed = 200
    xbg = 0
end

function love.update(dt)
    xbg = (xbg - bg_scroll_speed * dt) % -VIRTUAL_WIDTH

end

function love.draw()
    push:start()
    love.graphics.draw(bg, xbg, 0)
    love.graphics.draw(bg, VIRTUAL_WIDTH + xbg, 0)
    push:finish()
end