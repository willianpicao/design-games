WIDTH = 854
HEIGTH = 480

function love.load()
    love.graphics.setDefaultFilter('nearest','nearest')
    love.window.setMode(WIDTH, HEIGTH)
    frames= {}
    for i=1,4 do
        frame = love.graphics.newImage('wizzard_m_run_anim_f'..i..'.png')
        table.insert(frames, frame)
    end
    curFrame = 1
end

function love.update(dt)
    curFrame = curFrame + dt * 4
    if curFrame >= 5 then
        curFrame = 1
    end
end

function love.draw()
    idx = math.floor(curFrame)
    love.graphics.draw(frames[idx],0,0,0,15,15)
end