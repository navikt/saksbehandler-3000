local json = require('json')
local contents
local file = io.open("data/users.json", "r")
contents = file:read("*a")
io.close(file)
local data = {numbers = {}, currentNumber = 1}
data.users = json.decode(contents)

function data.current()
   local values = {
      user = data.users[data.currentNumber],
      innvilget = true,
      type = "sykemelding",
      søknad = {
	 diagnose = "Brukket tommel",
	 lege = "Lege Legesen",
	 mottattAvNav = "2019-09-01",
	 periode = {
	    from = "2019-08-29",
	    to = "2019-10-12"
	 },
	 signertAvLege = "2019-09-01",
	 sykemeldingsgrad = "100%"
      }
   }

   values.user.image = math.random(10)

   return values
end


function data.next()
   local nextNumber = math.random(#data.users)
   while data.numbers[nextNumber] do
      nextNumber = math.random(#data.users)
   end
   data.numbers[nextNumber] = true
   data.currentNumber = nextNumber

   return data.current()
end

return data
