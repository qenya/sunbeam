local prototype = {}

function prototype:init()
end

function prototype:instantiate(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	return o
end

return prototype
