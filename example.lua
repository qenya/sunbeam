local sunbeam = require 'sunbeam'

local Object = sunbeam{thing = 0}

function Object:init()
	self.constant = "test"
end

local child = Object()

child.thing = 3
print (Object.thing) -- 0

print (child.constant) -- "test"
