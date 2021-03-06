--
-- sunbeam: Yet another Lua object model
--
-- Version 1.1.0
--
-- Copyright 2017 Timon Walshe-Grey <me@timon.red>
--
-- This library is free software; you can redistribute it and/or modify it
-- under the terms of the MIT license. See LICENSE for details.
--

local symbols = {
	prototype = {},
	constructor = {},
	super = {}
}

function symbols.prototype:get()
	return self[symbols.prototype]
end
function symbols.prototype:set(value)
	if rawget(self, symbols.prototype) then
		error("cannot reassign an object's prototype")
	else
		self[symbols.prototype] = value
	end
end

function symbols.constructor:get()
	if rawget(self, symbols.constructor) then
		return self[symbols.constructor]
	elseif self.prototype ~= self then
		return self.prototype.constructor
	else
		return function() end
	end
end
function symbols.constructor:set(value)
	if type(value) == 'function' or getmetatable(value).__call then
		self[symbols.constructor] = value
	else
		error("an object's constructor must be callable")
	end
end

function symbols.super:get()
	local method_owner = self
	return function(self, ...)
		if method_owner == self then
			print("warning: self:super(...) is deprecated")
			print("       : use type.super(self, ...) instead")
			return self.prototype.prototype.constructor(self, ...)
		else
			return method_owner.prototype.constructor(self, ...)
		end
	end
end
function symbols.super:set(value)
	error("cannot reassign an object's superconstructor")
end

local metatable = {}

function metatable:__index(key)
	if symbols[key] then
		return symbols[key].get(self)
	elseif self.prototype ~= self then
		return self.prototype[key]
	else
		return nil
	end
end

function metatable:__newindex(key, value)
	if symbols[key] then
		symbols[key].set(self, value)
	else
		rawset(self, key, value)
	end
end

function metatable:__call(...)
	local instance = {}
	setmetatable(instance, metatable)
	instance.prototype = self or instance
	instance:constructor(...)
	return instance
end

return metatable.__call
