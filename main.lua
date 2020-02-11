function love.load()
    x = 400
    y = 300
    x2 = 0
    y2 = 0
    line_length = 50
    angle = 1.79769
    movement_speed = 150
    rotation_speed = math.pi
end

function love.update(dt)
    local dx = love.mouse.getX() - love.graphics.getWidth()/2

    if dx == 0 then
        if love.keyboard.isDown("left") then
            angle = angle - rotation_speed * dt
        elseif love.keyboard.isDown("right") then
            angle = angle + rotation_speed * dt
        end
    else
        angle = angle + dx*4 * dt
        love.mouse.setPosition(love.graphics.getWidth()/2, love.graphics.getHeight()/2)
    end

    if love.keyboard.isDown("space") or love.mouse.isDown(1) then
        x = x + math.cos(angle) * dt * movement_speed
        y = y + math.sin(angle) * dt * movement_speed
    end

    x2 = x + math.cos(angle) *  line_length
    y2 = y + math.sin(angle) *  line_length
end

function love.draw()
    love.graphics.circle("line", x, y, 16)
    love.graphics.line(x, y, x2, y2)
end