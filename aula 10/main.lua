WINDOW_WIDTH = 1024
WINDOW_HEIGHT= 576
WIDTH= 640
HEIGHT= 360

push = require 'lib/push'
wf = require 'lib/windfield'
Class = require 'lib/class'
sti= require 'lib/sti'
Camera = require 'lib/camera'
require 'Player'
require 'Map'


function love.load()
    love.graphics.setDefaultFilter('nearest','nearest')
    push:setupScreen(WIDTH, HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT)

    world = wf.newWorld(0,800, false)
    world:setQueryDebugDrawing(true)

    player= Player(world)

    map = Map(world)

    

    cam = Camera()
end

function love.update(dt)
    world:update(dt)
    player:update(dt)
    map:update(dt)
end

function love.keypressed(key)
    if key == "w" then
        player:jump()
    end

end

function love.draw()
    love.graphics.clear(117/255, 247/255, 246/255)
    push:start()
    cam:attach()
    -- world:draw()
    map:draw()
    player:draw()
    -- e:draw()
    -- for _, e in ipairs(enemies) do
    --     e:draw()
    -- end
    cam:lookAt(player.x, HEIGHT - 70 )
    cam:detach()
    push:finish()
end