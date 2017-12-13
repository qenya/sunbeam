local sunbeam = require 'sunbeam'

local Parent = sunbeam.Object()

function Parent:init(label)
	self.label = label
end

local child = Parent("test")
print (Parent.label) -- nil
print (child.label) -- "test"

Parent.thing = 5
child.thing = child.thing + 2
print (Parent.thing) -- 5
print (child.thing) -- 7

print (child.__prototype == Parent) -- true
