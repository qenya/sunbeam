local Object = {}

function Object:init()
end

function Object:__call(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	return o
end

setmetatable(Object, Object)

return {
	Object = Object
}
