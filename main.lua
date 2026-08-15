-- Aqui estou tentando ao máximo escrever tudo de memória e adicionar comentários para não me perder no processo
-- Just a Screen_Window using love
-- Just Better Text and a key to close

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

push = require 'push'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest') --NÃO JUNTAR OS PIXELS E SIM MOSTRAR CADA UM INDIVIDUALMENTE
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
    --love.graphics.prinf(message, x, y, [width], mode)
    love.graphics.printf('Hello World', 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')
    push.finish()
end



