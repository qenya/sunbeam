local sunbeam = require 'sunbeam'

local fruit = sunbeam()
function fruit:constructor(color)
	self.color = color
end

local tomato = fruit("red")
print(fruit.color) -- nil
print(tomato.color) -- "red"

fruit.sweetness = 7
tomato.sweetness = tomato.sweetness - 5
print(fruit.sweetness) -- 7
print(tomato.sweetness) -- 2

print(tomato.prototype == fruit) -- true


local peartomato = tomato("yellow")
print(peartomato.color) -- yellow

--[[
function tomato:constructor(color)
	super(color) -- TODO: Decide syntax
end
local peartomato = tomato("yellow")
print(peartomato.color) -- yellow
]]
