local prototype = {}

function prototype:init()
end

function prototype:__call(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	return o
end

setmetatable(prototype, prototype)

return prototype
