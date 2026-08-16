-- Aqui estou tentando ao máximo escrever tudo de memória e adicionar comentários para não me perder no processo
-- Just a Screen_Window using love
-- Just Better Text and a key to close

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

player1Score = 0
player2Score = 0

push = require 'push'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest') --NÃO JUNTAR OS PIXELS E SIM MOSTRAR CADA UM INDIVIDUALMENTE

    mineBigFont = love.graphics.newFont('Monocraft.ttc', 32) --ADICIONA A FONTE AO OBJETO
    mineSmallFont = love.graphics.newFont('Monocraft.ttc', 16) --POSSO TER VARIAS FONTS COM VARIOS TAMANHOS

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        resizable = false,  --REDIMENSIONAVEL
        fullscreen = false, --TELA CHEIA
        vsync = true        --SINCRONIZAR COM A TAXA DO MONITOR   
    })
    push.setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { upscale = 'normal'}) --CRIAR UMA TELA VIRTUAL PARA PIXELS MAIORES
end

function love.keypressed(key) --TECLA PRECIONADA
    if key == 'space' then    --TECLA DE ESPAÇO
        love.event.quit()     --FECHAR O JOGO
    end
end

function love.draw()
    push.start()
    --love.graphics.clear(r, g, b, a) COLOCAR COR NO FUNDO (a >>> Transparência | valor/255 pois precisa estar entre 0 e 1)
    love.graphics.clear(52/255, 21/255, 57/255, 0)
    love.graphics.setFont(mineSmallFont)
    --love.graphics.prinf(message, x, y, [width], mode)
    --love.graphics.print(message, x, y) SEM A FORMATAÇÃO SÓ PRECISA DAS COORDENADAS PRONTAS E APENAS ISSO...
    love.graphics.printf(tostring(player1Score), 0, VIRTUAL_HEIGHT / 2 - 20, VIRTUAL_WIDTH - 20, 'center')
    love.graphics.printf(tostring(player2Score), 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')

    -- ball
    love.graphics.rectangle('fill', 30, 30, 10, 10) 
    -- paddle 1
    love.graphics.rectangle('fill', 10, 10, 5, 20)     
    -- paddle 2
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 15, VIRTUAL_HEIGHT - 30, 5, 20)

    push.finish()
end



