WIDTH = 854
HEIGTH = 480

function love.load()
    love.window.setMode(WIDTH,HEIGTH)
    image = love.graphics.newImage('ken.png')
    img_width = image:getWidth()
    img_heigth = image:getHeight()
    sprite_width = img_width/7
    sprite_heigth = img_heigth/10
    sprites= {}
    sprites.hadouken = {}
    sprites.idle = {}

    sprites.hadouken = get_sprites_by_row(1,4)
    sprites.idle= get_sprites_by_row(2,4)

    curFrame = 1
    state = 'idle'
end

function love.update(dt)
    curFrame= curFrame + 8 * dt
    if curFrame > 4 then
        curFrame = 1
        if state == 'hadouken' then
            state = 'idle'
        end
    end
end

function love.draw()
    idx = math.floor(curFrame)
    if state == 'idle' then
        love.graphics.draw(image, sprites.idle[idx], 30, 30, 0, 2, 2)
    elseif state == 'hadouken' then
        love.graphics.draw(image, sprites.hadouken[idx], 30, 30, 0, 2, 2)      
    end
end

function love.keypressed(key)
    if key == 'h' then
        state= 'hadouken'
        curFrame = 1
    end
end

function get_sprites_by_row(row, numSprites)
    local sprites = {}
    for i=0,numSprites-1 do
        sprite = love.graphics.newQuad(i * sprite_width,
                            (row-1) * sprite_heigth,
                            sprite_width, sprite_heigth,
                            img_width, img_heigth)
        table.insert(sprites, sprite)
    end

    return sprites
end