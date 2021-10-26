WIDTH= 960
HEIGTH= 540

function love.load()

    math.randomseed(os.time())
    love.window.setMode(WIDTH,HEIGTH)--,{resizable = true,minwidth = 854, minheight = 480})
    love.window.setTitle("Ping Pong")
    racket1= {}
    racket1.x = 10
    racket1.y = HEIGTH/2 - 40
    racket1.w= 20
    racket1.h= 80
    racket1.speed = 0 --velocidade de deslocamento da raquete 1
    racket1.score= 0

    ball= {}
    ball.x = WIDTH/2
    ball.y = HEIGTH/2
    ball.w = 20
    ball.h = 20
    ball.dx = 0 -- velocidade da bola no eixo x
    ball.dy = 0

    bigFont = love.graphics.newFont('Thirteen-Pixel-Fonts.ttf',70)
    smallFont = love.graphics.newFont('Thirteen-Pixel-Fonts.ttf',30)

    state= 'start'

end

function love.update(dt)

    --Muda direção ao colidir
    if collides(ball, racket1) then 
        ball.dx = -ball.dx * 1.09
        ball.x = racket1.x + racket1.w
        ball.dy = math.random(-200,200)
        racket1.score= racket1.score + 1
    end
    --Colisão borda superior
    if ball.y < 0 then
        ball.y = 0
        ball.dy= -ball.dy
    end
    --Colisão borda a direita
    if ball.x + ball.w > WIDTH then 
        ball.x = WIDTH - ball.w
        ball.dx = -ball.dx
    end
    --Colisão borda inferior
    if ball.y + ball.h > HEIGTH then
        ball.y = HEIGTH - ball.h
        ball.dy = -ball.dy
    end

    
    ball.x = ball.x + ball.dx * dt --movimenta bola eixo x
    ball.y = ball.y + ball.dy * dt --movimenta bola eixo y


    racket1.y = racket1.y + racket1.speed * dt

    --verificar presseão das teclas seta p baixo e seta p cima
    if love.keyboard.isDown('up')then
        racket1.speed = - 300
    elseif love.keyboard.isDown('down') then
        racket1.speed = 300
    else
        racket1.speed = 0
    end

    --se bolinha passa da borda esquerda reinicia
    if ball.x < 0 then
        state = 'start'
        ball.dx = 0
        ball.dy= 0
        ball.x= WIDTH/2
        ball.y= HEIGTH/2
    end


end

function love.draw()
    love.graphics.setColor(1, 20/255, 1)
    --Estado inicial
    if state == 'start' then
        love.graphics.setFont(smallFont)
        love.graphics.printf('Pressione enter para jogar!', 0, HEIGTH/4, WIDTH, 'center')
    end
    
    --Pontuação
    love.graphics.setFont(bigFont)
    love.graphics.printf(racket1.score,200, HEIGTH/2, WIDTH, 'left')
    love.graphics.printf(0,0, HEIGTH/2, WIDTH-200, 'right')

    --Deseja bola e raquete apos pressionadoa enter
    if state == 'play' then
        love.graphics.setColor(20/255, 1, 1)
        love.graphics.rectangle('line', racket1.x, racket1.y,racket1.w,racket1.h)
        love.graphics.rectangle('line', ball.x, ball.y,ball.w,ball.h)
    end

end

function collides(ball,racket)
    --Bola acima ou abaixo da raquete com uma lacuna entre os dois
    if ball.y > racket.y + racket.h or ball.y + ball.h < racket.y then
        return false
    end
    --Bola do lado direito ou esquerdo da raquete com lacuna entre eles
    if ball.x > racket.x + racket.w or ball.x + ball.w < racket.x then
        return false
    end
    return true
end

--callback
function love.keypressed(key)
    if state == 'start' and key == 'return' then
        ball.dx = -500
        ball.dy = math.random(-150.150)
        state= 'play'
        racket1.score = 0
    end
end