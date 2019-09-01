local utf8 = require("utf8")
local data = require('data')
local score = require('score')
local users = require('users')
local applications = require('applications')

function love.load()
   love.window.setMode(1440, 900, {fullscreen=false})
   --love.window.setFullscreen(true, "desktop")

   font = love.graphics.newFont("pixelplay.ttf", 26)
   bigFont = love.graphics.newFont("pixelplay.ttf", 36)

   stamps = {
      approve = {
	 image = love.graphics.newImage("images/stempel_godkjent.png"),
	 x = 200
      },
      decline = {
	 image = love.graphics.newImage("images/stempel_avslag.png")
      },
      sharedY = 0
   }
   tableImages = {
      dog = love.graphics.newImage("images/hund.png"),
      postit1 = love.graphics.newImage("images/postit_gul.png"),
      postit2 = love.graphics.newImage("images/postit_rosa.png")
   }

   stamps.sharedY = love.graphics.getHeight() - stamps.approve.image:getHeight() - 20
   stamps.decline.x = stamps.approve.x + stamps.approve.image:getWidth() + 20

   time = {
      start = love.timer.getTime(),
      left = 60
   }
   points = {
      correct = 0,
      wrong = 0
   }

   application = data[1]
end

function love.update()
   local timeUsed = (love.timer.getTime() - time.start)
   time.left = 61 - timeUsed
end

function love.draw()
   -- TODO: Table
   love.graphics.setColor(139 / 255, 69 / 255, 19 / 255)
   love.graphics.polygon("fill", {
			    100, 200,
			    love.graphics.getWidth() - 100, 200,
			    love.graphics.getWidth() - 25, love.graphics.getHeight(),
			    25, love.graphics.getHeight()})
   love.graphics.setColor(.8, .8, .8)
   love.graphics.rectangle("fill", 100, 0, love.graphics.getWidth() - 200, 200)

   love.graphics.draw(tableImages.postit1, 225, 8, 0)
   love.graphics.draw(tableImages.dog, 700, 8, 0)
   love.graphics.draw(tableImages.postit2, 1000, 8)

   -- TODO: Info about person
   users.draw(application.user)

   -- TODO: The søknad
   applications.draw(application.application)

   -- TODO: Info about score and time left
   score.draw(points, time.left)

   -- TODO: Stamps
   love.graphics.setColor(1, 1, 1)
   love.graphics.draw(stamps.approve.image, stamps.approve.x, stamps.sharedY)
   love.graphics.draw(stamps.decline.image, stamps.decline.x, stamps.sharedY)   
end

function love.keypressed(key)
   if key == 'a' then
      if application.application.approved then
	 points.wrong = points.wrong + 1
      else
	 points.correct = points.correct + 1
      end
   elseif key == 'g' then
      if application.application.approved then
	 points.correct = points.correct + 1
      else
	 points.wrong = points.wrong + 1
      end
   end
end

function love.mousereleased(x, y, button, istouch, presses)
end
