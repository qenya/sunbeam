local metatable = {}

function metatable:__index(key)
	if key == 'constructor' or key == 'prototype' then
		return nil
	elseif self.prototype ~= self then
		return self.prototype[key]
	end
end

function metatable:__call(...)
	if self.constructor == nil then
		error("cannot instantiate an object with no constructor")
	end

	local instance = {}
	setmetatable(instance, metatable)
	instance.prototype = self
	self.constructor(instance, ...)
	return instance
end


function sunbeam()
	local instance = {}
	setmetatable(instance, metatable)
	instance.prototype = instance
	return instance
end

return sunbeam
