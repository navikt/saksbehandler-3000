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
      application = {
	 type = "sykemelding",
	 periode =  "1. september - 30. september",
	 sykmeldingsgrad = "100%",
	 diagnose = "L87 ICPC-2 - Bursitt/tendinitt/synovitt IKA",
	 signed = "Skrevet og signert av lege: 20. oktober",
	 lege = "Lisa Olsen",
	 mottatt = "Mottatt av NAV: 1. november",
	 ferie = "Nei",
	 approved = false
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
