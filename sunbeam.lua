local Object = {}

function Object:init()
end

function Object:__call(...)
	local instance = {}
	setmetatable(instance, self)
	self.__index = self
	instance:init(...)
	return instance
end

setmetatable(Object, Object)

return {
	Object = Object
}
