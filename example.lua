local sunbeam = require 'sunbeam'

local Parent = sunbeam.Object{thing = 0}

function Parent:init()
	self.constant = "test"
end

local child = Parent()

child.thing = 3
print (Parent.thing) -- 0

print (child.constant) -- "test"
