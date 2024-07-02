  --CONFIGURAÇÕES DO PERSONAGEM
  chicken = {
    walk = {},
    anim_frame = 1,
    pos_x = 0,
    pos_y = 250,
    anim_time = 0,
    height = 25,
    width = 31
  }
  
  --CONFIGURAÇÕES INICIAIS
  isNight = false
  game_over = false 
  isRain = false
  contador = 0
  jogo_acabou = false
  isGameStarted = false
  buttonX = 260
  buttonY = 485
  buttonWidth = 270
  buttonHeight = 90
  
  --INICIANDO O JOGO
  function love.mousepressed(x, y, button, istouch, presses)
    if not isGameStarted and button == 1 and x >= buttonX and x <= buttonX + buttonWidth and y >= buttonY and y <= buttonY + buttonHeight then
      isGameStarted = true
      isNight = false
      game_over = false
      isRain = false
      vidas = 2
      placar = 0
      carro1_speed = 200
      carro2_speed = 60
      carro3_speed = 130
      carro4_speed = 140
      carro5_speed = 70
      carro6_speed = 120
      truck1_speed = 30
      truck2_speed = 40
      moto1_speed = 120
      moto2_speed = 110
      moto3_speed = 130
      chicken.pos_x = 0
      chicken.pos_y = 250
      contador = 0
      love.audio.play(theme)
      love.audio.play(carro_sound)
      carro_sound:setVolume(0.05)
      love.audio.play(moto_sound)
      moto_sound:setVolume(0.05)
      
    end
end

  vidas = 2
  placar = 0

  river_offset = 0
  rain_offset = 0

  carro1_y = 100
  carro1_speed = 200

  carro2_y = -50
  carro2_speed = 60

  carro3_y = -50
  carro3_speed = 130

  carro4_y = 0
  carro4_speed = 140

  carro5_y = 30
  carro5_speed = 70

  carro6_y = 100
  carro6_speed = 120

  truck1_y = -50
  truck1_speed = 30

  truck2_y = 300
  truck2_speed = 40

  moto1_y = 300
  moto1_speed = 120

  moto2_y = 100
  moto2_speed = 110

  moto3_y = 300
  moto3_speed = 130

  intervalobuzina = 10
  tempobuzina = 0
  
  
--CARREGAR ELEMENTOS DO JOGO
  function love.load()
    
    for x = 1, 3 do
      chicken.walk[x] = love.graphics.newImage("images/character/chicken_" .. x .. ".png")
    end
    
    for x = 4, 6 do
      chicken.walk[x] = love.graphics.newImage("images/character/chicken_" .. x .. ".png")
    end
    
    for x = 7, 9 do
      chicken.walk[x] = love.graphics.newImage("images/character/chicken_" .. x .. ".png")
    end
    
    for x = 10, 12 do
      chicken.walk[x] = love.graphics.newImage("images/character/chicken_" .. x .. ".png")
    end
    
    road = love.graphics.newImage("images/scenario/road.png")
    grass = love.graphics.newImage("images/scenario/grass_1.png")
    river = love.graphics.newImage("images/scenario/river.png")
    carro1 = love.graphics.newImage("images/vehicles/car_1.png")
    carro2 = love.graphics.newImage("images/vehicles/car_2.png")
    carro3 = love.graphics.newImage("images/vehicles/car_3.png")
    carro4 = love.graphics.newImage("images/vehicles/car_1.png")
    carro5 = love.graphics.newImage("images/vehicles/car_2.png")
    carro6 = love.graphics.newImage("images/vehicles/car_3.png")
    truck1 = love.graphics.newImage("images/vehicles/truck_1.png")
    truck2 = love.graphics.newImage("images/vehicles/truck_2.png")
    moto1 = love.graphics.newImage("images/vehicles/motorcycle_1.png")
    moto2 = love.graphics.newImage("images/vehicles/motorcycle_2.png")
    moto3 = love.graphics.newImage("images/vehicles/motorcycle_1.png")
    abertura = love.graphics.newImage("images/scenario/menu.jpg")
    chuva = love.graphics.newImage("images/decoration/rain_drops-01.png")
    ponte = love.graphics.newImage("images/scenario/bridge.png")
    poste = love.graphics.newImage("images/decoration/lamp.png")
    arvoredo = love.graphics.newImage("images/decoration/trees.png")
    arvore = love.graphics.newImage("images/decoration/tree_2.png")
    vida = love.graphics.newImage("images/scenario/heart.png")
    gameover = love.graphics.newImage("images/scenario/gameover.jpg")
    
    chuva_audio = love.audio.newSource("sounds/rain1.wav", "stream")
    chuva_audio:setLooping(true)
    carro_sound = love.audio.newSource("sounds/car.wav", "stream")
    carro_sound:setLooping(true)
    moto_sound = love.audio.newSource("sounds/moto.mp3", "stream")
    moto_sound:setLooping(true)
    perdeu = love.audio.newSource("sounds/perdeu.wav")
    passo = love.audio.newSource("sounds/step.wav")
    morte = love.audio.newSource("sounds/death.wav")
    horn = love.audio.newSource("sounds/horn.wav")
    win = love.audio.newSource("sounds/win.mp3")
    theme = love.audio.newSource("sounds/theme.wav","stream")
    theme:setLooping(true)
    
      -- Reproduzir o som ambiente
      love.audio.play(theme)
      love.audio.play(carro_sound)
      carro_sound:setVolume(0.05)
      love.audio.play(moto_sound)
      moto_sound:setVolume(0.05)
      
  end

--DIMENSÕES DOS RIOS
  rio1 = {
    x = 300,
    y = 0,
    w = 75,
    h =150
  }

  rio2 = {
    x = 300,
    y = 227,
    w = 75,
    h =173
  }
    
  rio3 = {
    x = 300,
    y = 477,
    w = 75,
    h =123
  }
    
  rio4 = {
    x = 585,
    y = 0,
    w = 75,
    h =275
  }
    
    rio5 = {
    x = 585,
    y = 352,
    w = 75,
    h =248
  }

  function CheckBoxCollision(x1, y1, w1, h1, x2, y2, w2, h2)
      return x1 < x2 + w2 and
             x2 < x1 + w1 and
             y1 < y2 + h2 and
             y2 < y1 + h1
  end


  function love.update(dt)
    if isGameStarted then -- JOGO RODANDO
    
    --LOOP PARA O SOM DA BUZINA
    tempobuzina = tempobuzina + dt
    if tempobuzina >= intervalobuzina then
      love.audio.play(horn)
      tempobuzina = 0
    end
    
    
    --MOVIMENTOS DA GALINHA(X, Y, ANIMAÇÃO, E EFEITO SONORO)
    if love.keyboard.isDown("d") then
      chicken.pos_x = chicken.pos_x + (100*dt)
      chicken.anim_time = chicken.anim_time + dt
      if chicken.anim_time > 0.1 then
        chicken.anim_frame = chicken.anim_frame + 1
        if chicken.anim_frame > 3 then
          chicken.anim_frame = 1
        end
        chicken.anim_time = 0
      end
      love.audio.play(passo)
      passo:setPitch(3)
    end
    
    if love.keyboard.isDown("a") then
      chicken.pos_x = chicken.pos_x - (100*dt)
      chicken.anim_time = chicken.anim_time + dt
      if chicken.anim_time > 0.1 then
        chicken.anim_frame = chicken.anim_frame + 1
        if chicken.anim_frame < 4 or chicken.anim_frame > 6 then
          chicken.anim_frame = 4
        end
        chicken.anim_time = 0
      end
      love.audio.play(passo)
      passo:setPitch(3)
    end

    if love.keyboard.isDown("w") then
      chicken.pos_y = chicken.pos_y - (100*dt)
      chicken.anim_time = chicken.anim_time + dt
      if chicken.anim_time > 0.08 then
        chicken.anim_frame = chicken.anim_frame + 1
        if chicken.anim_frame < 7 or chicken.anim_frame > 9 then
          chicken.anim_frame = 7
        end
        chicken.anim_time = 0
      end
      love.audio.play(passo)
      passo:setPitch(3)
    end

    if love.keyboard.isDown("s") then
      chicken.pos_y = chicken.pos_y + (100*dt)
      chicken.anim_time = chicken.anim_time + dt
      if chicken.anim_time > 0.08 then
        chicken.anim_frame = chicken.anim_frame + 1
        if chicken.anim_frame < 10 or chicken.anim_frame > 12 then
          chicken.anim_frame = 10
        end
        chicken.anim_time = 0
      end
      love.audio.play(passo)
      passo:setPitch(3)
    end


    --COMANDO PARA A GALINHA NÃO SAIR DO MAPA
    chicken.pos_y = math.max(0, math.min(love.graphics.getHeight() - chicken.height, chicken.pos_y))


    --EFEITO DE MOVIMENTO DO RIO
    river_offset = river_offset + 50 * dt
    if river_offset > 150 then
      river_offset = river_offset - 150
    end

    --EFEITO DE MOVIMENTO DA CHUVA
    rain_offset = rain_offset + 250 * dt
    if rain_offset > 150 then
      rain_offset = rain_offset - 150
    end
    
    --CONFIGURAÇÃO DO DESLOCAMENTO DOS VEÍCULOS
    carro1_y = carro1_y + carro1_speed * dt
    carro2_y = carro2_y + carro2_speed * dt
    carro3_y = carro3_y + carro3_speed * dt
    carro4_y = carro4_y - carro4_speed * dt
    carro5_y = carro5_y - carro5_speed * dt
    carro6_y = carro6_y - carro6_speed * dt
    truck1_y = truck1_y + truck1_speed * dt
    truck2_y = truck2_y - truck2_speed * dt
    moto1_y = moto1_y + moto1_speed * dt
    moto2_y = moto2_y + moto2_speed * dt
    moto3_y = moto3_y - moto3_speed * dt
    
    
    --CASO A GALINHA ATRAVESSE O MAPA, A VELOCIDADE DOS VEÍCULOS AUMENTA,
    --A GALINHA VOLTA PARA O INÍCIO, SOMA 1 NO PLACAR + EFEITO SONORO 
    if chicken.pos_x > love.graphics.getWidth() then
      love.audio.play(win)
      contador = contador + 1
      chicken.pos_x = 0
      carro1_speed = carro1_speed + 15
      carro2_speed = carro2_speed + 15
      carro3_speed = carro3_speed + 15
      carro4_speed = carro4_speed + 15
      carro5_speed = carro5_speed + 15
      carro6_speed = carro6_speed + 15
      truck1_speed = truck1_speed + 15
      truck2_speed = truck2_speed + 15
      moto1_speed = moto1_speed + 15
      moto2_speed = moto2_speed + 15
      moto3_speed = moto3_speed + 15
      placar = placar + 1
    end
    
    --CONFIGURAÇÃO DOS ESTÁGIOS DE JOGO
    if contador == 2 then
      isNight = true
      end
    if contador == 4 then
      isNight = false
      isRain = true
      end
    if contador == 6 then
      isRain = true
      isNight = true
      end
    
    --EFEITO SONORO DE CHUVA
    if isRain then
        if not chuva_audio:isPlaying() then
            love.audio.play(chuva_audio)
        end
    else
        if chuva_audio:isPlaying() then
            love.audio.stop(chuva_audio)
        end
    end
    
    --REPETIÇÃO DOS VEÍCULOS NA TELA
    if carro1_y > love.graphics.getHeight() then
      carro1_y = -carro1:getHeight()
    end
    
    if carro2_y > love.graphics.getHeight() then
      carro2_y = -carro2:getHeight()
    end
    
    if carro3_y > love.graphics.getHeight() then
      carro3_y = -carro3:getHeight()
    end
    
    if carro4_y < -carro4:getHeight() then
      carro4_y = love.graphics.getHeight()
    end

    if carro5_y < -carro5:getHeight() then
      carro5_y = love.graphics.getHeight()
    end

    if carro6_y < -carro6:getHeight() then
      carro6_y = love.graphics.getHeight()
    end
    
    if truck1_y > love.graphics.getHeight() then
      truck1_y = -truck1:getHeight()
    end
    
    if truck2_y < -truck2:getHeight() then
      truck2_y = love.graphics.getHeight()
    end
    
    if moto1_y > love.graphics.getHeight() then
      moto1_y = -moto1:getHeight()
    end

    if moto2_y > love.graphics.getHeight() then
      moto2_y = -moto2:getHeight()
    end
    
    if moto3_y < -moto3:getHeight() then
      moto3_y = love.graphics.getHeight()
    end

    --DIMENSÕES E POSIÇÕES DOS VEÍCULOS PARA CONFIGURAR A COLISÃO
    local vehicles = {
      {x = 118, y = carro1_y, width = 28, height = 53},
      {x = 150, y = carro2_y, width = 28, height = 69},
      {x = 485, y = carro3_y, width = 28, height = 69},
      {x = 425, y = carro4_y - 53, width = 28, height = 53},
      {x = 260, y = carro5_y - 69, width = 28, height = 69},
      {x = 210, y = carro6_y - 69, width = 28, height = 69},
      {x = 520, y = truck1_y, width = 56, height = 125},
      {x = 385, y = truck2_y - 109, width = 32, height = 109},
      {x = 100, y = moto1_y, width = 18, height = 35},
      {x = 180, y = moto2_y, width = 18, height = 35},
      {x = 455, y = moto3_y - 35, width = 18, height = 35,}
    }
    
    --CHECAR COLISAO COM OS VEÍCULOS
      colisao = false
      for _, vehicle in ipairs(vehicles) do
          if CheckBoxCollision(chicken.pos_x, chicken.pos_y, chicken.width, chicken.height, vehicle.x, vehicle.y, vehicle.width, vehicle.height) then
              chicken.pos_x = 0
              chicken.pos_y = 250
              colisao = true
              break
          end
      end
      
      if colisao == true then
          vidas = vidas - 1
          love.audio.play(morte)
          if vidas < 0 then
             game_over = true
          end
      end
      
    --CHECAR COLISÃO COM O RIO
    colisao_rio = false
    if CheckBoxCollision(chicken.pos_x, chicken.pos_y, chicken.width, chicken.height, rio1.x, rio1.y, rio1.w, rio1.h) or
      CheckBoxCollision(chicken.pos_x, chicken.pos_y, chicken.width, chicken.height, rio2.x, rio2.y, rio2.w, rio2.h) or
      CheckBoxCollision(chicken.pos_x, chicken.pos_y, chicken.width, chicken.height, rio3.x, rio3.y, rio3.w, rio3.h) or
      CheckBoxCollision(chicken.pos_x, chicken.pos_y, chicken.width, chicken.height, rio4.x, rio4.y, rio4.w, rio4.h) or
      CheckBoxCollision(chicken.pos_x, chicken.pos_y, chicken.width, chicken.height, rio5.x, rio5.y, rio5.w, rio5.h) then
      chicken.pos_x = 0
      chicken.pos_y = 250
      colisao_rio = true
    end
      
    if colisao_rio == true then
      vidas = vidas - 1
      love.audio.play(morte)
    end
    if vidas < 0 then
      game_over = true
      jogo_acabou = true
      isNight = false
      isRain = false
    end
  
  
      --REINÍCIO DO JOGO COM A TECLA "SPACE"
      if jogo_acabou then
       if love.keyboard.isDown("space") then
         isNight = false
        game_over = false
        isRain = false
        vidas = 2
        placar = 0
        carro1_speed = 200
        carro2_speed = 60
        carro3_speed = 130
        carro4_speed = 140
        carro5_speed = 70
        carro6_speed = 120
        truck1_speed = 30
        truck2_speed = 40
        moto1_speed = 120
        moto2_speed = 110
        moto3_speed = 130
        chicken.pos_x = 0
        chicken.pos_y = 250
        contador = 0
        love.audio.play(theme)
        love.audio.stop(perdeu)
        love.audio.play(carro_sound)
        love.audio.play(moto_sound)
        jogo_acabou = false
      end
      
      --MENU INICIAL COM A TECLA "V"
      if love.keyboard.isDown("v") then
        isGameStarted = false
        contador = 0
        love.audio.stop(perdeu)
      end
      return
    end
  end
end


--DESENHAR ELEMENTOS NA TELA
function love.draw()
  
  --SE isNight FOR VERDADEIRO, DESENHA OS ELEMENTOS DA TELA COM UM FILTRO AZUL, SIMULANDO NOITE
  if isGameStarted then 
    for i = 0, 5 do 
      if isNight then
        love.graphics.setColor(30, 30, 60)
        love.graphics.draw(road, 100, i * 100)
        love.graphics.setColor(30, 30, 60)
        love.graphics.draw(road, 475, i * 100)
        love.graphics.setColor(30, 30, 60)
        love.graphics.draw(road, 375, i * 150)
        love.graphics.setColor(30, 30, 60)
        love.graphics.draw(road, 200, i * 100)
    end
    end
    love.graphics.setColor(255, 255, 255)
    
    --SE isNight FOR FALSO, DESENHA OS ELEMENTOS DA COR ORIGINAL
    for i = 0, 5 do
      if isNight == false then
        love.graphics.draw(road, 100, i * 100)
        love.graphics.draw(road, 475, i * 100)
        love.graphics.draw(road, 375, i * 100)
        love.graphics.draw(road, 200, i * 100)
      end
    end

  for i = 0, 11 do
    if isNight then
      love.graphics.setColor(30, 30, 60)
      love.graphics.draw(grass, 0, i*50)
      love.graphics.setColor(30, 30, 60)
      love.graphics.draw(grass, 50, i*50)
      love.graphics.setColor(30, 30, 60)
      love.graphics.draw(grass, 625, i*50)
      love.graphics.setColor(30, 30, 60)
      love.graphics.draw(grass, 675, i*50)
      love.graphics.setColor(30, 30, 60)
      love.graphics.draw(grass, 725, i*50)
      love.graphics.setColor(30, 30, 60)
      love.graphics.draw(grass, 775, i*50)
    end
  end
    
    for i = 0, 11 do
      if isNight == false then
        love.graphics.draw(grass, 0, i*50)
        love.graphics.draw(grass, 50, i*50)
        love.graphics.draw(grass, 625, i*50)
        love.graphics.draw(grass, 675, i*50)
        love.graphics.draw(grass, 725, i*50)
        love.graphics.draw(grass, 775, i*50)
      end
    end

    --DESENHA O RIO COM A ANIMAÇÃO
    for i = -1, 3 do
      if isNight == false then
      love.graphics.draw(river, 300, i * 150 + river_offset)
      end
    end
    
    
    for i = -1, 3 do
      if isNight then
        love.graphics.setColor(100, 100, 100)
        love.graphics.draw(river, 300, i * 150 + river_offset)
    end
  end

    for i = 0, 11 do
      if isNight == false then
        love.graphics.draw(grass, 575, i*50) -- GRAMA REDUZIDA
      end
    end

    for i = 0, 11 do
      if isNight then
        love.graphics.setColor(30, 30, 60)
        love.graphics.draw(grass, 575, i*50) -- GRAMA REDUZIDA COM FILTRO
      end
    end

    for i = -1, 3 do
      if isNight == false then
        love.graphics.draw(river, 585, i * 150 + river_offset)
      end
    end
  for i = -1, 3 do
        if isNight then
          love.graphics.setColor(100, 100, 100)
      love.graphics.draw(river, 585, i * 150 + river_offset)
    end
  end


  if isNight == false then
    love.graphics.draw(ponte, 298, 150)
    love.graphics.draw(ponte, 298, 400)
    love.graphics.draw(ponte, 582, 275)
    love.graphics.draw(carro1, 118, carro1_y)
    love.graphics.draw(carro2, 150, carro2_y)
    love.graphics.draw(carro3, 485, carro3_y)
    love.graphics.draw(carro4, 425, carro4_y, 0, 1, -1)
    love.graphics.draw(carro5, 260, carro5_y, 0, 1, -1)
    love.graphics.draw(carro6, 210, carro6_y, 0, 1, -1)
    love.graphics.draw(truck1, 520, truck1_y)
    love.graphics.draw(truck2, 385, truck2_y, 0, 1, -1)
    love.graphics.draw(moto1, 100, moto1_y)
    love.graphics.draw(moto2, 180, moto2_y)
    love.graphics.draw(moto3, 455, moto3_y, 0, 1, -1)
    love.graphics.draw(chicken.walk[chicken.anim_frame], chicken.pos_x, chicken.pos_y)
    love.graphics.draw(poste, 80, 100)
    love.graphics.draw(poste, 80, 300)
    love.graphics.draw(poste, 80, 500)
    love.graphics.draw(poste, 592, 100, 0, -1, 1)
    love.graphics.draw(poste, 592, 300, 0, -1, 1)
    love.graphics.draw(poste, 592, 500, 0, -1, 1)
    love.graphics.draw(arvoredo, 680, -20)
    love.graphics.draw(arvore, -15, 50)
    love.graphics.draw(arvore, -40, 350)
    love.graphics.draw(arvore, 0, 500)
    love.graphics.draw(arvoredo, 680, 350)
  end

  if isNight then
    love.graphics.setColor(60, 60, 60)
    love.graphics.draw(ponte, 298, 150)
    love.graphics.draw(ponte, 298, 400)
    love.graphics.draw(ponte, 582, 275)
    love.graphics.draw(carro1, 118, carro1_y)
    love.graphics.draw(carro2, 150, carro2_y)
    love.graphics.draw(carro3, 485, carro3_y)
    love.graphics.draw(carro4, 425, carro4_y, 0, 1, -1)
    love.graphics.draw(carro5, 260, carro5_y, 0, 1, -1)
    love.graphics.draw(carro6, 210, carro6_y, 0, 1, -1)
    love.graphics.draw(truck1, 520, truck1_y)
    love.graphics.draw(truck2, 385, truck2_y, 0, 1, -1)
    love.graphics.draw(moto1, 100, moto1_y)
    love.graphics.draw(moto2, 180, moto2_y)
    love.graphics.draw(moto3, 455, moto3_y, 0, 1, -1)
    love.graphics.draw(poste, 592, 300, 0, -1, 1)
    love.graphics.draw(poste, 592, 500, 0, -1, 1)
    love.graphics.draw(arvoredo, 680, -20)
    love.graphics.draw(arvore, -15, 50)
    love.graphics.draw(arvore, -40, 350)
    love.graphics.draw(arvore, 0, 500)
    love.graphics.draw(arvoredo, 680, 350)
  end

    if isNight then
      love.graphics.setColor(150,150,150)
      love.graphics.draw(poste, 80, 100)
    end

    if isNight then
      love.graphics.setColor(150,150,150)
      love.graphics.draw(poste, 80, 300)
    end

    if isNight then
      love.graphics.setColor(150,150,150)
      love.graphics.draw(poste, 80, 500)
    end

    if isNight then
      love.graphics.setColor(150,150,150)
      love.graphics.draw(poste, 592, 100, 0, -1, 1)
    end

    if isNight then
      love.graphics.setColor(150,150,150)
      love.graphics.draw(poste, 592, 300, 0, -1, 1)
    end

    if isNight then
      love.graphics.setColor(150,150,150)
      love.graphics.draw(poste, 592, 500, 0, -1, 1)
    end

    if isNight then
      love.graphics.setColor(100,150,150)
      love.graphics.draw(chicken.walk[chicken.anim_frame], chicken.pos_x, chicken.pos_y)
    end
   
   
    --DECREMENTA A IMAGEM DE VIDA DO PERSONAGEM
    love.graphics.setColor(255, 255, 255)
    for i = 0, vidas do
      love.graphics.draw(vida, 650 + (i-1) * 60, 10)
    end
    
    
    --MOSTRA A PONTUAÇÃO DO PLAYER
    love.graphics.setFont(love.graphics.newFont(20))
    love.graphics.print("Placar: " .. placar, 10, 10)
    
    
    --SE O PLAYER PERDER TODAS AS VIDAS, O AUDIO PRINCIPAL DO JOGO PARA
    if vidas < 0 then
      love.audio.stop(theme)
      love.audio.stop(moto_sound)
      love.audio.stop(carro_sound)
      love.audio.stop(horn)
      love.audio.stop(passo)
      love.audio.stop(morte)
      love.graphics.draw(gameover, 0, 0)
      love.audio.play(perdeu)
    end
    
    --TELA DE GAMEOVER E CONTADOR = 0 PARA RECOMEÇAR
    defaultColor = {love.graphics.getColor()}  
    if game_over then
      love.graphics.draw(gameover, 0, 0)
      contador = 0
    end
    
    --SIMULA FARÓIS DOS VEÍCULOS E LUZES DO POSTE NO MODO NOITE
    if isNight == true then
      love.graphics.setColor(220,220,0,70)
      
      love.graphics.polygon("fill", 125, carro1_y + 48, 107, carro1_y + 110, 140,carro1_y + 110)
      love.graphics.polygon("fill", 140, carro1_y + 48, 130, carro1_y + 110, 158,carro1_y + 110)
      
      love.graphics.polygon("fill", 156, carro2_y + 64, 140, carro2_y + 120, 170,carro2_y + 120)
      love.graphics.polygon("fill", 172, carro2_y + 64, 160, carro2_y + 120, 188,carro2_y + 120)
      
      love.graphics.polygon("fill", 109, moto1_y + 27, 90, moto1_y + 100, 130, moto1_y + 100)
      
      love.graphics.polygon("fill", 189, moto2_y + 27, 170, moto2_y + 100, 205, moto2_y + 100)
      
      love.graphics.polygon("fill", 490, carro3_y + 63, 478, carro3_y + 120, 508,carro3_y + 120)
      love.graphics.polygon("fill", 508, carro3_y + 63, 498, carro3_y + 120, 525,carro3_y + 120)
      
      love.graphics.polygon("fill", 430, carro4_y - 46, 420, carro4_y - 120, 445,carro4_y - 120)
      love.graphics.polygon("fill", 448, carro4_y - 46, 436, carro4_y - 120, 460,carro4_y - 120)
      
      love.graphics.polygon("fill", 265, carro5_y - 63, 255, carro5_y - 120, 280,carro5_y - 120)
      love.graphics.polygon("fill", 283, carro5_y - 63, 271, carro5_y - 120, 295,carro5_y - 120)
      
      love.graphics.polygon("fill", 215, carro6_y - 63, 205, carro6_y - 120, 230,carro6_y - 120)
      love.graphics.polygon("fill", 233, carro6_y - 63, 221, carro6_y - 120, 245,carro6_y - 120)
      
      love.graphics.polygon("fill", 464, moto3_y - 24, 450, moto3_y - 120, 475,moto3_y - 120)
      
      love.graphics.polygon("fill", 390, truck2_y - 105, 380, truck2_y - 180, 405,truck2_y - 180)
      love.graphics.polygon("fill", 412, truck2_y - 105, 396, truck2_y - 180, 420,truck2_y - 180)
      
      love.graphics.polygon("fill", 532, truck1_y + 118, 515, truck1_y + 180, 548,truck1_y + 180)
      love.graphics.polygon("fill", 565, truck1_y + 118, 545, truck1_y + 180, 578,truck1_y + 180)
      
      love.graphics.ellipse("fill", 100, 175, 40, 20)
      love.graphics.ellipse("fill", 100, 375, 40, 20)
      love.graphics.ellipse("fill", 100, 575, 40, 20)
      love.graphics.ellipse("fill", 575, 175, 40, 20)
      love.graphics.ellipse("fill", 575, 375, 40, 20)
      love.graphics.ellipse("fill", 575, 575, 40, 20)
    end
    
    
    --DESENHA A CHUVA COM ANIMAÇÃO
    if isRain then
      for i = -4, 10 do
        love.graphics.draw(chuva, 0, i * 64 + rain_offset)
      end
    
      for i = -4, 10 do
        love.graphics.draw(chuva, 256, i * 64 + rain_offset)
      end
    
      for i = -4, 10 do
        love.graphics.draw(chuva, 512, i * 64 + rain_offset)
      end
    
      for i = -4, 10 do
        love.graphics.draw(chuva, 768, i * 64 + rain_offset)
      end
    end
    else
      love.graphics.draw(abertura,0,0)   
    end
    
end