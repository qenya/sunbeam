local sunbeam = require 'sunbeam'

-- Create a base object by calling sunbeam().
local fruit = sunbeam()
print(fruit.prototype == fruit) -- true

-- Instantiate objects by calling them.
local apple = fruit()
print(apple.prototype == fruit) -- true

-- Give an object a constructor and new instances will call it.
function fruit:constructor(color)
	self.color = color
end
apple = fruit("red")
print(apple.color) -- red

-- Instances inherit properties from their prototypes.
fruit.niceDessert = true
print(apple.niceDessert) -- true

-- But you can change them without affecting the prototype.
local tomato = fruit("red")
tomato.niceDessert = false
print(fruit.niceDessert) -- true
print(apple.niceDessert) -- true
print(tomato.niceDessert) -- false

-- By default, constructors are also inherited.
local greenzebra = tomato("green")
print(tomato.color) -- red
print(greenzebra.color) -- green

-- But you can also call a superconstructor manually.
function tomato:constructor(shape, color)
	self:super(color)
	self.shape = shape
end
local cornseed = tomato("pearshaped", "yellow")
print(cornseed.shape) -- pearshaped
print(cornseed.color) -- yellow
