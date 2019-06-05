local utf8 = require("utf8")
local users = require('users')

function love.load()
   love.window.setFullscreen(true, "desktop")
   paper = love.graphics.newImage("paper.png")

   approved = 0
   denied = 0

   search = ""
   no_user = "No user"
   current_user = nil
end

function love.update()
   if search:len() == 11 then
      current_user = users[tonumber(search)]
   else
      current_user = nil
   end
end

function love.draw()
   local eee = 238 / 255
   love.graphics.setColor(eee, eee, eee)
   love.graphics.rectangle("fill", love.graphics.getWidth() - 400, 0, 400, love.graphics.getHeight())
   love.graphics.setColor(1, 1, 1)
   love.graphics.rectangle("fill", love.graphics.getWidth() - 400, 0, 400, 50)
   love.graphics.setColor(0, 0, 0)
   love.graphics.print(search, love.graphics.getWidth() - 390, 10, 0, 2)
   if current_user then
      love.graphics.print(current_user.name, love.graphics.getWidth() - 390, 60, 0, 2)
      love.graphics.print(current_user.gender, love.graphics.getWidth() - 390, 100, 0, 2)
      love.graphics.print(current_user.birthday, love.graphics.getWidth() - 390, 140, 0, 2)
      love.graphics.print(current_user.address, love.graphics.getWidth() - 390, 180, 0, 2)
      love.graphics.print(current_user.work, love.graphics.getWidth() - 390, 220, 0, 2)
   else
      love.graphics.print(no_user, love.graphics.getWidth() - 390, 60, 0, 2)
   end


   love.graphics.setColor(0, 1, 0)
   love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 200, 200, 200)
   love.graphics.setColor(1, 0, 0)
   love.graphics.rectangle("fill", love.graphics.getWidth() - 600, love.graphics.getHeight() - 200, 200, 200)

   love.graphics.setColor(1, 1, 1)
   love.graphics.draw(paper, 140, 40, 0, 1)

   love.graphics.setColor(1, 1, 1)
   love.graphics.print("Approved: " .. approved, 10, 10)
   love.graphics.print("Denied: " .. denied, 10, 25)
end

function love.keypressed(key)
    if key == "backspace" then
        -- get the byte offset to the last UTF-8 character in the string.
        local byteoffset = utf8.offset(search, -1)

        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
	   search = string.sub(search, 1, byteoffset - 1)
        end
    end
end

function love.textinput(text)
   if tonumber(text) ~= nil and not (search:len() >= 11) then
      search = search .. text
   end
end

function love.mousereleased(x, y, button, istouch, presses)
   if button == "l" or button == 1 then
      if x > 0 and x < 200
	 and y > (love.graphics.getHeight() - 200) and y < love.graphics.getHeight()
      then
	 approved = approved + 1
      end

      if x > love.graphics.getWidth() - 600 and x < love.graphics.getWidth() - 400
	 and y > (love.graphics.getHeight() - 200) and y < love.graphics.getHeight()
      then
	 denied = denied + 1
      end
   end
end
