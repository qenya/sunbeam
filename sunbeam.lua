local metatable = {}

function metatable:__index(key)
	if self.__prototype ~= self then
		return self.__prototype[key]
	end
end

function metatable:__call(...)
	local instance = {}
	setmetatable(instance, metatable)
	instance.__prototype = self
	instance:init(...)
	return instance
end

local Object = {}
Object.__prototype = Object
Object.init = function() end

setmetatable(Object, metatable)

return {
	Object = Object
}
