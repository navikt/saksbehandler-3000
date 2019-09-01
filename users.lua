local users = {
   background = {238 / 255, 238 / 255, 238 / 255},
   images = {
      female = {
	 love.graphics.newImage("images/characters/kvinne-1.png"),
	 love.graphics.newImage("images/characters/kvinne-2.png"),
	 love.graphics.newImage("images/characters/kvinne-3.png"),
	 love.graphics.newImage("images/characters/kvinne-4.png"),
	 love.graphics.newImage("images/characters/kvinne-5.png"),
	 love.graphics.newImage("images/characters/kvinne-6.png"),
	 love.graphics.newImage("images/characters/kvinne-7.png"),
	 love.graphics.newImage("images/characters/kvinne-8.png"),
	 love.graphics.newImage("images/characters/kvinne-9.png"),
	 love.graphics.newImage("images/characters/kvinne-10.png")
      },
      male = {
	 love.graphics.newImage("images/characters/mann-1.png"),
	 love.graphics.newImage("images/characters/mann-2.png"),
	 love.graphics.newImage("images/characters/mann-3.png"),
	 love.graphics.newImage("images/characters/mann-4.png"),
	 love.graphics.newImage("images/characters/mann-5.png"),
	 love.graphics.newImage("images/characters/mann-6.png"),
	 love.graphics.newImage("images/characters/mann-7.png"),
	 love.graphics.newImage("images/characters/mann-8.png"),
	 love.graphics.newImage("images/characters/mann-9.png"),
	 love.graphics.newImage("images/characters/mann-10.png")
      }
   }
}

function users.draw(user)
   love.graphics.push()
   love.graphics.rotate(-0.03)
   local base_x = 200
   local base_y = 250
   local width = love.graphics.getWidth() / 3
   local height = love.graphics.getHeight() / 2
   local topPadding = base_y + 15
   local leftPadding = base_x + 15
   local textPadding = font:getHeight()

   love.graphics.setFont(font)
   love.graphics.setColor(users.background)
   love.graphics.rectangle("fill", base_x, base_y, width, height)

   love.graphics.setColor(1, 1, 1)
   local image = nil
   if user.gender == "female" then
      image = users.images.female[user.image]
   elseif user.gender == "male" then
      image = users.images.male[user.image]
   end
   love.graphics.draw(image, base_x + width - image:getWidth() - 15, topPadding)

   love.graphics.setColor(0, 0, 0)
   if user then
      love.graphics.print(user.first_name, leftPadding, topPadding)
      love.graphics.print(user.last_name, leftPadding, textPadding + topPadding)
      love.graphics.print(user.birth_date, leftPadding, textPadding * 2 + topPadding)
      love.graphics.print(user.street_address, leftPadding, textPadding * 3 + topPadding)
   else
      love.graphics.print("No user", padding, 60)
   end
   love.graphics.pop()
end

return users
