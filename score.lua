local score = {}

function score.draw(score, timeLeft)
   local base_x = 1175
   local base_y = 20
   local limit = 150
   local formatedTime = string.format('%d', timeLeft)
   local formatedScore = string.format('%d poeng', score.correct - score.wrong)

   love.graphics.setFont(bigFont)

   love.graphics.setColor(0, 0, 0)
   love.graphics.printf(formatedScore, base_x, base_y, limit, "right")
   love.graphics.printf(formatedTime, base_x, bigFont:getHeight() + base_y, limit, "right")
end

return score
