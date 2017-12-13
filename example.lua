local sunbeam = require 'sunbeam'

local fruit = sunbeam()
function fruit:init(color)
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
