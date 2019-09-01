local score = {}

function score.draw(timeLeft)
   local base_x = 1175
   local base_y = 20
   local limit = 150
   local formatedTime = string.format('%d', timeLeft)

   love.graphics.setFont(bigFont)

   love.graphics.setColor(0, 0, 0)
   love.graphics.printf("0 poeng", base_x, base_y, limit, "right")
   love.graphics.printf(formatedTime, base_x, bigFont:getHeight() + base_y, limit, "right")
end

return score
