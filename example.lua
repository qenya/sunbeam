local sunbeam = require 'sunbeam'

local object = sunbeam:instantiate{thing = 0}

function object:init()
	self.constant = "test"
end

local child = object:instantiate{}

child.thing = 3
print (object.thing) -- 0

print (child.constant) -- "test"
