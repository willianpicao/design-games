WINDOW_WIDTH = 1024
WINDOW_HEIGHT= 576
WIDTH= 640
HEIGHT= 360


push = require 'lib/push'
wf = require 'lib/windfield'
Class = require 'lib/class'
sti = require 'lib/sti'
Camera = require 'lib/camera'
require 'Player'
require 'Map'
require 'Enemy'

function love.load()

    Font = love.graphics.newFont('Thirteen-Pixel-Fonts.ttf', 60)
    littleFont = love.graphics.newFont('Thirteen-Pixel-Fonts.ttf', 15)

    love.graphics.setDefaultFilter('nearest','nearest')
    push:setupScreen(WIDTH, HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT)

    world = wf.newWorld(0,800, false)
    world:setQueryDebugDrawing(true)
    world:addCollisionClass('Platform')
    world:addCollisionClass('Enemy')
    -- plat = world:newRectangleCollider(5, 300, 640, 60, {collision_class = 'Solids'})
    -- plat:setType('static')

    player = Player(world)
    map = Map(world)
    enemies = {}
    bat = love.graphics.newImage('character_0024.png')
    
    for _, obj in ipairs(map.gameMap.layers['Enemies'].objects) do
        table.insert(enemies, Enemy(world, bat, obj.x, obj.y))
    end
    
    cam = Camera()
    son = {}
    son.background = love.audio.newSource("Our-Mountain_v003.mp3", 'static')
    son.jump = love.audio.newSource("Jump2.wav", 'static')
    son.background:play()
    love.audio.setVolume(0.1)
    state= 'init'
    

end

function love.update(dt)
    if state == 'start' then
        player:update(dt)

    end
    world:update(dt)
    for _, e in ipairs(enemies) do
        e:update(dt)
    end
    
    map:update(dt)
end

function love.keypressed(key)
    if key == 'w' and state == 'start' then
        player: jump()
        son.jump:play()
    end
    if key == 'space' then
        state = 'start'
    end
    
end

function love.draw()
    love.graphics.clear(177/255, 247/255, 246/255)
    push:start()
    cam:attach()
    --world:draw()
    map:draw()
    if state == 'start' then
        player:draw()
    elseif state == 'init' then
        love.graphics.setFont(Font)
        love.graphics.setColor(1, 20/255, 1)
        love.graphics.printf('Ezairis', 0, HEIGHT/3, WIDTH, 'left')
        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(littleFont)
        love.graphics.setColor(1, 20/255, 1)
        love.graphics.printf('Aperte espaço para jogar', 0, HEIGHT/3 + 75, WIDTH, 'left')
        love.graphics.setColor(1, 1, 1)
    end
    for _, e in ipairs(enemies) do
        e:draw()
    end
    if state== 'init' then

        cam:lookAt(WIDTH - 375, HEIGHT-75)
    end
    if state== 'start' then

        cam:lookAt(player.x, HEIGHT-75)
    end

    cam:detach()
    push:finish()
    
end