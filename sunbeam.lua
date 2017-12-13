local metatable = {}

function metatable:__index(key)
	if key == 'prototype' then
		return nil
	elseif self.prototype ~= self then
		return self.prototype[key]
	end
end

function metatable:__call(...)
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
	instance.constructor = function() end
	return instance
end

return sunbeam
