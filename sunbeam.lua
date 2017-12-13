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


function sunbeam(o)
	o = o || {}
	o.__prototype = o
	o.init = function() end
	setmetatable(o, metatable)
	return o
end

return sunbeam
