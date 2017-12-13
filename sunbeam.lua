local metatable = {}

function metatable:__index(key)
	if key == '__constructor' or key == '__prototype' then
		return nil
	elseif self.__prototype ~= self then
		return self.__prototype[key]
	end
end

function metatable:__call(...)
	if self.__constructor == nil then
		error("cannot instantiate an object with no constructor")
	end

	local instance = {}
	setmetatable(instance, metatable)
	instance.__prototype = self
	self.__constructor(instance, ...)
	return instance
end


function sunbeam(o)
	o = o or {}
	o.__prototype = o
	setmetatable(o, metatable)
	return o
end

return sunbeam
