local applications = {background = {226 / 255, 232 / 255, 187 / 255}}

function applications.draw(application)
   love.graphics.push()
   --love.graphics.shear(-0.03, 0.03)
   love.graphics.rotate(0.03)
   local base_x = 800
   local base_y = 200
   local text_x = base_x + 15
   local width = love.graphics.getWidth() / 3
   local height = love.graphics.getHeight() / 1.4
   local textPadding = 50

   love.graphics.setColor(applications.background)
   love.graphics.rectangle("fill", base_x, base_y, width - 20, height)

   love.graphics.setFont(bigFont)
   love.graphics.setColor(0, 0, 0)
   love.graphics.print("Søknad", text_x, base_y)

   if application.type == "sykemelding" then
      love.graphics.print("Sykepenger", text_x, base_y + textPadding)
      love.graphics.setFont(font)
      love.graphics.print(string.format("Periode %s", application.periode),
			  text_x, base_y + textPadding * 2)
      love.graphics.print(string.format("Sykmeldingsgrad: %s", application.sykmeldingsgrad),
			   text_x, base_y + textPadding * 3)
      love.graphics.printf(string.format("Diagnose: %s", application.diagnose),
			   text_x, base_y + textPadding * 4,
			   width - 15)
      love.graphics.print(application.signed,
			  text_x, base_y + textPadding * 5)
      love.graphics.print(string.format("Lege: %s", application.lege),
			  text_x, base_y + textPadding * 6)
      love.graphics.print(string.format("Mottatt: %s", application.mottatt),
			  text_x, base_y + textPadding * 7)
      love.graphics.print(string.format("Ferie: %s", application.ferie),
			  text_x, base_y + textPadding * 8)
   end
   love.graphics.pop()
end

return applications
