local menu = {images = { }}

local function newImage(firstTime)
   if firstTime then
      x = math.random(love.graphics.getWidth())
   else
      x = -math.random(100) - 100
   end
   gender = math.random() > 0.5 and 'kvinne' or 'mann'
   return {
      love.graphics.newImage(
	 string.format("images/characters/%s-%d.png", gender, math.random(10))
      ),
      x,
      math.random(love.graphics.getHeight()),
      math.random(5) + 2
   }
end

for i=1,40 do
   menu.images[i] = newImage(true)
end

setmetatable(menu, {__call = function(self)
		       local i = 0
		       return function()
			  i = i + 1
			  if i <= #menu.images and menu.images[i] then
			     return i, unpack(menu.images[i])
			  end
		       end
end})

function menu.update()
   local width = love.graphics.getWidth()
   for i, image, x, y, speed in menu() do
      x = x + speed
      speed = speed + math.random() / 100
      if x > width then
	 menu.images[i] = newImage()
      else
	 menu.images[i] = {image, x, y, speed}
      end
   end
end

function menu.draw()
   -- parallax
   for i, image, x, y, speed in menu() do
      love.graphics.draw(image, x, y)
   end
   

   love.graphics.setColor(1, 1, 1)
   love.graphics.setFont(hugeFont)
   love.graphics.print("Saksbehandler", 100, 100)
   love.graphics.setFont(bigFont)
   love.graphics.print("3000", 400, 170)

   love.graphics.setFont(bigFont)
   love.graphics.setColor(1, 1, 1)
   local base_x = 800
   for i, score, name in highscore() do
      love.graphics.print(string.format("%d - %s", score, name), base_x, i * 40)
      if i >= 10 then break end
   end
end

return menu
