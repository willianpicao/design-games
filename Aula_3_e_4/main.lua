WIDTH = 1024
HEIGHT= 576
BULLET_SPEED = 300
ROBOT_SPEED = 120
math.randomseed(os.time())

function love.load() -------------------
    love.window.setMode(WIDTH, HEIGHT)
    sprite= {}
    sprite.shooter = love.graphics.newImage('imagens/soldier1_gun.png')
    sprite.robot = love.graphics.newImage('imagens/robot1_hold.png')
    sprite.bullet = love.graphics.newImage('imagens/tile_187.png')
    sprite.hole = love.graphics.newImage('imagens/tile_483.png')

    shooter= {}
    shooter.x = WIDTH/2 
    shooter.y = HEIGHT/2
    shooter.speed = 160
    shooter.rotation = 0
    bullets = {}
    robots= {}
    holes = createHoles()
    timeLimit = 3
    timer = timeLimit

end

function love.draw () -----------------
    love.graphics.print("Qtde. de balas" .. #bullets)
    love.graphics.draw(sprite.shooter,
     shooter.x, 
     shooter.y, 
     shooter.rotation,     --Rotação   
     nil,   --Escala em X
     nil,   --Escala em Y
     sprite.shooter:getWidth()/2, -- Origem em X
     sprite.shooter:getHeight()/2 -- Origem em Y
    )

    for i,h in  ipairs(holes) do
        love.graphics.draw(sprite.hole, h.x, h.y)
    end

    for i, b in ipairs(bullets) do
        love.graphics.draw(sprite.bullet, b.x, b.y,0,nil,nil,sprite.bullet:getWidth()/2,sprite.bullet:getHeight()/2)
    end
    for i, r in ipairs(robots) do
        love.graphics.draw(sprite.robot, r.x, r.y, r.direction,nil,nil, sprite.robot:getWidth()/2, sprite.robot:getHeight()/2)
    end
end

function love.keypressed (key)
    if key == 'space' then
        local bullet = {}
        bullet.x = shooter.x
        bullet.y = shooter.y
        bullet.direction = mouseShooterAngle()
        table.insert(bullets, bullet)
    end
    if key == 'return' then
        r = createRobot()
        table.insert(robots, r)
    end
end

function love.update (dt) ------------------
    timer = timer - dt
    if timer <=0 then
        table.insert(robots, createRobot())
        timeLimit = timeLimit * 0.93
        timer = timeLimit
    end

    if love.keyboard.isDown('w') then
        shooter.y = shooter.y - shooter.speed * dt
    end
    if love.keyboard.isDown('s') then
        shooter.y = shooter.y + shooter.speed * dt
    end
    if love.keyboard.isDown('a') then
        shooter.x = shooter.x - shooter.speed * dt
    end
    if love.keyboard.isDown('d') then
        shooter.x = shooter.x + shooter.speed * dt
    end

    for i=#bullets,1,-1 do
        b = bullets[i]
        b.x = b.x + BULLET_SPEED * math.cos(b.direction) * dt
        b.y = b.y + BULLET_SPEED * math.sin(b.direction) * dt

        if b.x < 0 or b.x > WIDTH or
            b.y < 0 or b.y > HEIGHT then
                table.remove(bullets, i)
        else
            for i, r in ipairs (robots) do
                if collides(b, r, 23) then
                    table.remove(bullets, i)
                    r.hit = true
                end
            end
        end
    end
    for i=#robots,1, -1 do
        r= robots[i]
        r.direction = shooterRobotAngle(r)
        r.x = r.x + ROBOT_SPEED * math.cos(r.direction) * dt
        r.y = r.y + ROBOT_SPEED * math.sin(r.direction) * dt
        if r.hit then
            table.remove(robots, i)
        end
    end
    shooter.rotation = mouseShooterAngle()

end

function mouseShooterAngle()
   return math.atan2(love.mouse.getY() - shooter.y,
        love.mouse.getX() - shooter.x )
end

function shooterRobotAngle(r)
    return math.atan2(shooter.y - r.y, shooter.x - r.x)
end

function createRobot()
    local robot = {}
    --robot.x = math.random(0,WIDTH) 
    --robot.y = math.random(0,HEIGHT)
    i = math.random(1,4)
    robot.x = holes[i].x + sprite.hole:getWidth()/2
    robot.y = holes[i].y + sprite.hole:getHeight()/2
    robot.direction = shooterRobotAngle(robot)
    robot.hit = false
    return robot
end

function collides(a, b, c)
    if math.sqrt( (a.y - b.y)^2 + (a.x - b.x)^2) <= c then
        return true
    end
    return false
end

function createHoles()
    local holes = {}
    table.insert(holes,{x=10, y=10})
    table.insert(holes,{x=WIDTH-sprite.hole:getWidth()-10, y=10})
    table.insert(holes,{x=WIDTH-sprite.hole:getWidth()-10, y=HEIGHT - sprite.hole:getHeight() -10})
    table.insert(holes,{x=10, y=HEIGHT - sprite.hole:getHeight() -10})
    return holes

end