WIDTH = 1024
HEIGHT = 576
BULLET_SPEED = 320
delayRegarga = 0.6
max_balas = 25
regargaPoder = 6
tempoDeRegarga = 1
function love.load() --------------------------------------------------------------------
    love.window.setMode(WIDTH, HEIGHT)
    love.window.setTitle("Picon El atirador")
    bigFont = love.graphics.newFont('Thirteen-Pixel-Fonts.ttf', 70)
    smallFont = love.graphics.newFont('Thirteen-Pixel-Fonts.ttf', 30)
    littleFont = love.graphics.newFont('Thirteen-Pixel-Fonts.ttf', 15)
    sprite = {}
    sprite.shooter = love.graphics.newImage('imagens/soldier1_gun.png')
    sprite.robot = love.graphics.newImage('imagens/robot1_hold.png')
    sprite.bullet = love.graphics.newImage('imagens/tile_187.png')
    sprite.hole = love.graphics.newImage('imagens/tile_483.png')
    bulletCharge = {}
    bulletCharge.reload = love.graphics.newImage('imagens/municao.png')
    bulletCharge.bullet = love.graphics.newImage('imagens/municao.png')
    bulletCharge.x = WIDTH - 114
    bulletCharge.y = HEIGHT - 43
    bulletCharge.delayReload = delayRegarga
    shooter = {}
    shooter.x = WIDTH/2
    shooter.y = HEIGHT/2
    shooter.speed = 160
    shooter.rotation = 0
    shooter.precision = 0
    shooter.munition = max_balas
    shooter.points = 0
    bullets = {}
    robots = {}
    holes = createHoles()
    control_level = {}
    timerLimit = 3
    timer = timerLimit
    max_robot = 30
    nRobots = max_robot
    wave = 1
    power = {}
    power.timerRotation = 0 -- Em segundos
    power.rotationTurbo = 0 -- Rotação inicial
    power.cooldown = RELOAD_POWER
    power.powerEnable = false
    firingRate = 0
    state = 'wait'

    son = {}
    son.tiro = love.audio.newSource("Blip_select 3.wav", 'static')
    son.kill = love.audio.newSource("Hit_hurt 5.wav", 'static')
end --------------------------------------------------------------------


function love.update(dt) --------------------------------------------------------------------

    if state == 'started'  then
        if timer <= 0 then
            if nRobots > 0 then
                table.insert(robots, createRobot(wave))
            end
    
            local final = 2 - wave / 18
            timerLimit = love.math.random(0, final) + love.math.random(-0.3 * wave, 0.3 * wave)
            timer = timerLimit
    
            if nRobots > 0 then
                nRobots = nRobots - 1
            elseif #robots == 0 then
                wave = wave + 1
                nRobots = max_robot + 7 * (wave - 1)
                timer = 2
            end
        elseif timer > 0 then
            timer = timer - dt
        end
    end

    if state == 'started' then
        playerMove(shooter, dt)
        rotationPower(dt)
        if firingRate >= 0 then
            firingRate = firingRate - dt
        end
        --if bulletCharge.delayReload > 0 and shooter.munition <= 0 then
        --    bulletCharge.delayReload = bulletCharge.delayReload - dt
        --elseif shooter.munition <= 0 then
        --    shooter.munition = max_balas
        --    bulletCharge.delayReload = tempoDeRegarga
        --end 
    end
    bulletControl(dt)
    robotControl(dt)
end --------------------------------------------------------------------

function love.draw() --------------------------------------------------------------------
    love.graphics.setColor(1, 20/255, 1)
    if state == 'started' then
        love.graphics.setFont(smallFont)
        love.graphics.printf('Onda de Robos  - ' .. wave, 0, 10, WIDTH, 'center')
    end
    if state == 'started' or state == 'game_over' then
        love.graphics.printf(shooter.munition .. 'x', -144, HEIGHT - 55, WIDTH, 'right')
        love.graphics.setFont(littleFont)
        love.graphics.printf("special time: " ..power.cooldown,0,HEIGHT-50,WIDTH,'center')
        love.graphics.printf('Points: ' .. shooter.points, 0, HEIGHT/2, WIDTH, 'right')
        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(smallFont)
        love.graphics.setColor(250/255, 237/255, 39/255)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(sprite.shooter, shooter.x, shooter.y, shooter.rotation, nil, nil, sprite.shooter:getWidth()/2, sprite.shooter:getHeight()/2) 
        for i, b in ipairs(holes) do
            love.graphics.draw(sprite.hole, b.x, b.y)
        end
        for i, b in ipairs(bullets) do
            love.graphics.draw(sprite.bullet, b.x, b.y, 0, nil, nil, sprite.bullet:getWidth()/2, sprite.bullet:getHeight()/2)
        end
        for i, b in ipairs(robots) do
            love.graphics.draw(sprite.robot, b.x, b.y, b.direction, nil, nil, sprite.robot:getWidth()/2, sprite.robot:getHeight()/2)
        end
        if state == 'game_over' then
            love.graphics.setFont(bigFont)
            love.graphics.setColor(1, 20/255, 1)
            love.graphics.printf('GAME OVER', 0, HEIGHT/3, WIDTH, 'center')
            love.graphics.setColor(1, 1, 1)

            love.graphics.setFont(littleFont)
            love.graphics.setColor(1, 20/255, 1)
            love.graphics.printf('Aperte espaço para recomeçar', 0, HEIGHT/3 + 100, WIDTH, 'center')
            love.graphics.setColor(1, 1, 1)
        end
    end
    if state == 'wait' then
        love.graphics.setFont(bigFont)
        love.graphics.setColor(1, 20/255, 1)
        love.graphics.printf('El Cabron', 0, HEIGHT/3, WIDTH, 'center')
        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(smallFont)
        love.graphics.setColor(1, 20/255, 1)
        love.graphics.printf('O atirador!', 0, HEIGHT/3 + 80, WIDTH, 'center')
        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(littleFont)
        love.graphics.setColor(1, 20/255, 1)
        love.graphics.printf('Aperte espaço para jogar', 0, HEIGHT/3 + 150, WIDTH, 'center')
        love.graphics.setColor(1, 1, 1)
    end

end --------------------------------------------------------------------

function love.mousepressed(x, y, button, istouch)
    son.tiro:play()
    local variante = love.math.random(-1, 1)
    if button == 1 and power.powerEnable == false  and state == 'started' then
        if shooter.munition > 0 then
            createBullet(mouseShooterAngle(), shooter.precision, 0.12)
            shooter.munition = shooter.munition - 1
        end
    end
end
function createBullet(rad, erro, time)
    if firingRate <= 0 then
        local variante = love.math.random(-1, 1)
        firingRate = time
        local bullet = {}
        bullet.x = shooter.x
        bullet.y = shooter.y
        bullet.direction = rad + variante * erro
        table.insert(bullets, bullet)
    end
end
function bulletControl(dt)
    for i=#bullets, 1, -1 do
        b = bullets[i]
        b.x = b.x + BULLET_SPEED * math.cos(b.direction) * dt
        b.y = b.y + BULLET_SPEED * math.sin(b.direction) * dt
        if b.x < 0 or b.x > WIDTH or b.y < 0 or b.y > HEIGHT then
            table.remove(bullets, i)
        else
            for j, r in ipairs(robots) do
                if collides(b, r, 20) then
                    table.remove(bullets, i)
                    r.hit = true
                end
            end
        end
    end
end
function mouseShooterAngle()
    return math.atan2(love.mouse.getY() - shooter.y,
                      love.mouse.getX() - shooter.x)
end
function shooterRobotAngle(r)
    return math.atan2(shooter.y - r.y, shooter.x - r.x)
end
function createRobot(wave)
    local robot = {}
    i = love.math.random(1, 4)
    robot.x = holes[i].x + sprite.hole:getWidth()/2
    robot.y = holes[i].y + sprite.hole:getHeight()/2
    robot.direction = shooterRobotAngle(robot)
    robot.hit = false
    robot.velocity = love.math.random(110 + 3 * wave, 110 + 10 * wave)
    return robot
end
function collides(a, b, c)
    if math.sqrt((a.y - b.y)^2 + (a.x - b.x)^2) <= c then
        return true
    end
    return false
end
function distancePlayer(player, robot)
    return math.sqrt((player.y - robot.y)^2 + (player.x - robot.x)^2)
end
function createHoles()
    local holes = {}
    table.insert(holes, {x = 10, y = 10})
    table.insert(holes, {x = WIDTH - sprite.hole:getWidth() - 10, y = 10})
    table.insert(holes, {x = 10, y = HEIGHT - sprite.hole:getHeight() - 10})
    table.insert(holes, {x = WIDTH - sprite.hole:getWidth() - 10, y = HEIGHT - sprite.hole:getHeight() - 10})
    return holes
end
function rotationPower(dt)
    if love.keyboard.isDown('space') and power.cooldown <= 0 then
        power.timerRotation = MAX_ROTATION
        power.rotationTurbo = shooter.rotation
        power.cooldown = regargaPoder
        power.powerEnable = true
    elseif power.cooldown >= 0 and power.powerEnable == false then
        power.cooldown = power.cooldown - dt
    end
    if power.timerRotation >= 0 and power.powerEnable == true then
        createBullet(power.rotationTurbo, 0, 0.01)
        power.rotationTurbo = power.rotationTurbo + 12.56 * dt
        shooter.rotation = power.rotationTurbo

        power.timerRotation = power.timerRotation - dt
    else
        power.powerEnable = false
    end
end
function love.keypressed(key)
    if (state == 'game_over' or state == 'wait') and key == 'space' then
        shooter.x = WIDTH/2
        shooter.y = HEIGHT/2
        shooter.munition = max_balas
        shooter.points = 0
        timerLimit = 3
        timer = timerLimit
        nRobots = max_robot
        wave = 1
        power.timerRotation = 0
        power.rotationTurbo = 0
        power.cooldown = regargaPoder
        power.powerEnable = false
        for i=#robots, 1, -1 do
            table.remove(robots, i)
        end
        state = 'started'
    end
end
function playerMove(player, dt)
    if love.keyboard.isDown('w') then
        player.y = player.y - player.speed * dt
        player.precision = 0.15
    elseif love.keyboard.isDown('s') then
        player.y = player.y + player.speed * dt
        player.precision = 0.15
    else
        player.precision = 0
    end
    if love.keyboard.isDown('a') then
        player.x = player.x - player.speed * dt
        player.precision = 0.15
    elseif love.keyboard.isDown('d') then
        player.x = player.x + player.speed * dt
        player.precision = 0.15
    else
        player.precision = 0
    end
    player.rotation = mouseShooterAngle()
    if (player.x - 20) < 0 then
        player.x = 20
    elseif (player.x + 20) > WIDTH then
        player.x = WIDTH - 20
    end
    if (player.y - 20) < 0 then
        player.y = 20
    elseif (player.y + 20) > HEIGHT then
        player.y = HEIGHT - 20
    end
end
function robotControl(dt)
    for i=#robots, 1, -1 do
        local not_colision = true
        local index_colision = 0
        r = robots[i]
        for j=#robots , 1, -1 do
            r2 = robots[j]
            if i ~= j and collides(r, r2, 30) then
                not_colision = false
                index_colision = j
            end
        end
        if not_colision then
            r.direction = shooterRobotAngle(r)
            r.x = r.x + r.velocity * math.cos(r.direction) * dt
            r.y = r.y + r.velocity * math.sin(r.direction) * dt
        else
            r2 = robots[index_colision]
            if distancePlayer(shooter, r) <= distancePlayer(shooter, r2) then
                r.direction = shooterRobotAngle(r)
                r.x = r.x + r.velocity * math.cos(r.direction) * dt
                r.y = r.y + r.velocity * math.sin(r.direction) * dt
            else
                r2.direction = shooterRobotAngle(r2)
                r2.x = r2.x + r2.velocity * math.cos(r2.direction) * dt
                r2.y = r2.y + r2.velocity * math.sin(r2.direction) * dt
            end
        end
        if r.hit then
            shooter.points = shooter.points + 1
            table.remove(robots, i)
            son.kill:play()
        end
        if collides(r, shooter, 20) then
            state = 'game_over'
        end
    end
end