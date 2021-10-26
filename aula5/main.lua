WIDTH = 854
HEIGHT = 480

function love.load()
    love.graphics.setDefaultFilter('nearest','nearest')
    love.window.setMode(WIDTH,HEIGHT)
    sprites = {}
    sprites.block = love.graphics.newImage('img/bloco-grama.png')
    sprites.mage = love.graphics.newImage('img/wizzard_m_run_anim_f0.png')
    player = { x = 2 , y = 2 }

    tilemap = {
        {1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,1},
        {1,0,1,1,1,0,0,0,1},
        {1,0,1,0,0,0,0,0,1},
        {1,0,1,1,1,0,0,0,1},
        {1,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1}
    }
end

function love.draw()
    for i,row in ipairs (tilemap) do
        for j,v in ipairs(row) do
            if v ==1 then
                love.graphics.draw(sprites.block, j*64-64, i*64-64)
            end
        end
    end
    love.graphics.draw(sprites.mage, player.x * 64 - 64, player.y * 64 - 64,0,4,4)
end

function love.keypressed(key)
    local x = player.x
    local y = player.y

    if key == 'up' then
        y = y - 1
    elseif key == 'down' then
        y = y + 1
    elseif key == 'left' then
        x = x -1
    elseif key == 'right' then
        x = x + 1
    end

    if tilemap[y][x] ~= 1 then
        player.x = x
        player.y = y
    end
end