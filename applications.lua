local applications = {
   background = {226 / 255, 232 / 255, 187 / 255},
   months = {
      'januar',
      'februar',
      'mars',
      'april',
      'mai',
      'juni',
      'juli',
      'august',
      'september',
      'oktober',
      'november',
      'desember'
   }
}

function applications.convertDate(vardate)
   local y,m,d = string.match(vardate, '(%d+)-(%d+)-(%d+)')
   return string.format('%s %s %s', d, applications.months[tonumber(m)], y)
end

function applications.draw(type, application)
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

   if type == "Sykepenger" then
      love.graphics.print("Sykepenger", text_x, base_y + textPadding)
      love.graphics.setFont(font)
      love.graphics.print(string.format("Periode: %s - %s",
					applications.convertDate(application.periode.from),
					applications.convertDate(application.periode.to)),
			  text_x, base_y + textPadding * 2)
      love.graphics.print(string.format("Sykmeldingsgrad: %s", application.sykemeldingsgrad),
			   text_x, base_y + textPadding * 3)
      love.graphics.printf(string.format("Diagnose: %s", application.diagnose),
			   text_x, base_y + textPadding * 4,
			   width - 15)
      love.graphics.print(string.format("Skrevet og signert av lege: %s",
					applications.convertDate(application.signertAvLege)),
			  text_x, base_y + textPadding * 5)
      love.graphics.print(string.format("Lege: %s", application.lege),
			  text_x, base_y + textPadding * 6)
      if application.land then
      love.graphics.print(string.format("Land: %s", application.land),
			  text_x, base_y + textPadding * 7)
      end
      love.graphics.print(string.format("Mottatt av NAV: %s",
					applications.convertDate(application.mottattAvNav)),
			  text_x, base_y + textPadding * 8)
      if application.ferie then
      love.graphics.print(string.format("Ferie: %s - %s",
					applications.convertDate(application.ferie.from),
					applications.convertDate(application.ferie.to)),
			  text_x, base_y + textPadding * 9)
      end
   end
   love.graphics.pop()
end

return applications
