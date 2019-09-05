local json = require('json')

local data = {numbers = {}, currentNumber = 1}

local contents
local file = io.open("data/users.json", "r")
contents = file:read("*a")
io.close(file)
data.users = json.decode(contents)

file = io.open("data/applications.json", "r")
contents = file:read("*a")
io.close(file)
data.applications = json.decode(contents)


function data.current()
   local app = data.applications[data.currentNumber]
   app.user = data.users[data.currentNumber]
   app.user.image = math.random(10)

   return app
end


function data.next()
   if #data.numbers >= 100 then
      data.numbers = {}
      print("We've generated 100 applications, starting over")
   end
   local nextNumber = math.random(100)
   while data.numbers[nextNumber] do
      nextNumber = math.random(100)
   end
   data.numbers[nextNumber] = true
   data.currentNumber = nextNumber

   return data.current()
end

return data
