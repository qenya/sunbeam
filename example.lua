local sunbeam = require 'sunbeam'

local Parent = sunbeam.Object()
Parent.thing = 0

function Parent:init(label)
	self.label = label
end

local child = Parent("test")
child.thing = 3

print (Parent.thing) -- 0
print (child.label) -- "test"
