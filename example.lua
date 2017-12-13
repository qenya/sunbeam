local sunbeam = require 'sunbeam'

local fruit = sunbeam()
function fruit:__constructor(color)
	self.color = color
end

local tomato = fruit("red")
print(fruit.color) -- nil
print(tomato.color) -- "red"

fruit.sweetness = 7
tomato.sweetness = tomato.sweetness - 5
print(fruit.sweetness) -- 7
print(tomato.sweetness) -- 2

print(tomato.__prototype == fruit) -- true


print(pcall(function()
	local peartomato = tomato("yellow") -- error: cannot instantiate an object with no constructor
end))

--[[
function tomato:__constructor(color)
	super(color) -- TODO: Decide syntax
end
local peartomato = tomato("yellow")
print(peartomato.color) -- yellow
]]
