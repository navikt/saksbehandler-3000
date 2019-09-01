local utf8 = require("utf8")
local data = require('data')
local score = require('score')
local users = require('users')
local applications = require('applications')
local highscore = require('sick')
local gamestate = {
   MENU = 1,
   GAME = 2,
   END = 3
}
gamestate.current = gamestate.MENU

function love.load()
   love.window.setMode(1440, 900, {fullscreen=false})
   --love.window.setFullscreen(true, "desktop")

   font = love.graphics.newFont("pixelplay.ttf", 26)
   bigFont = love.graphics.newFont("pixelplay.ttf", 36)
   hugeFont = love.graphics.newFont("pixelplay.ttf", 72)

   highscore.set('highscore.txt', 1000, "NAV", 1)

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
end

function love.update()
   if gamestate.current == gamestate.GAME then
      local timeUsed = (love.timer.getTime() - time.start)
      time.left = time.duration - timeUsed
      if time.left <= 0 then
	 gamestate.current = gamestate.END
      end
   end
end

function love.draw()
   if gamestate.current == gamestate.MENU then
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

   elseif gamestate.current == gamestate.GAME then
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
      applications.draw(application.type, application.søknad)

      -- TODO: Info about score and time left
      score.draw(points, time.left)

      -- TODO: Stamps
      love.graphics.setColor(1, 1, 1)
      love.graphics.draw(stamps.approve.image, stamps.approve.x, stamps.sharedY)
      love.graphics.draw(stamps.decline.image, stamps.decline.x, stamps.sharedY)
   elseif gamestate.current == gamestate.END then
      love.graphics.setFont(hugeFont)
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.print(string.format("Du avslo %d riktige søknader", points.correct),
			  50, 50)
      love.graphics.print("Ditt navn?", 80, 120)
      love.graphics.print(string.format("-- %q", points.name),
			   110, 190)
   end
end

function love.keypressed(key)
   if gamestate.current == gamestate.MENU then
      if key == 'space' or key == 'return' then
	 startGame()
      elseif key == 'escape' then
	 highscore.save()
	 love.event.quit()
      end
   elseif gamestate.current == gamestate.GAME then
      if key == 'a' then
	 if application.innvilget then
	    points.wrong = points.wrong + 1
	 else
	    points.correct = points.correct + 1
	 end
	 application = data.next()
      elseif key == 'g' then
	 if application.innvilget then
	    points.correct = points.correct + 1
	 else
	    points.wrong = points.wrong + 1
	 end
	 application = data.next()
      elseif key == 'escape' then
	 backToMenu()
      end
   elseif gamestate.current == gamestate.END then
      if key == 'return' then
	 highscore.add(points.name, points.correct - points.wrong)
	 backToMenu()
      elseif key == 'escape' then
	 backToMenu()
      elseif key == 'backspace' then
	 points.name = points.name:sub(1, -2)
      end
   end
end

function love.textinput(t)
   if gamestate.current == gamestate.END then
      points.name = points.name .. t
   end
end

function startGame()
   time = {
      duration = 1,
      start = love.timer.getTime(),
      left = 60
   }
   points = {
      correct = 0,
      wrong = 0,
      name = ""
   }

   application = data.next()
   gamestate.current = gamestate.GAME
end

function backToMenu()
   gamestate.current = gamestate.MENU
end
