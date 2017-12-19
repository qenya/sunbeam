# sunbeam
Yet another Lua object model


## Usage

Create a base object by calling `sunbeam()`.

```lua
local fruit = sunbeam()
print(fruit.prototype == fruit) -- true
```

Instantiate objects by calling them.

```lua
local apple = fruit()
print(apple.prototype == fruit) -- true
```

Give an object a constructor and new instances will call it.

```lua
function fruit:constructor(color)
	self.color = color
end
apple = fruit("red")
print(apple.color) -- red
```

Instances inherit properties from their prototypes.

```lua
fruit.niceDessert = true
print(apple.niceDessert) -- true
```

But you can change them without affecting the prototype.

```lua
local tomato = fruit("red")
tomato.niceDessert = false
print(fruit.niceDessert) -- true
print(apple.niceDessert) -- true
print(tomato.niceDessert) -- false
```

By default, constructors are also inherited.

```lua
local greenzebra = tomato("green")
print(tomato.color) -- red
print(greenzebra.color) -- green
```

But if you need to override the constructor, you can also call `super()`.

```lua
function tomato:constructor(shape, color)
	tomato.super(self, color)
	self.shape = shape
end
local cornseed = tomato("pearshaped", "yellow")
print(cornseed.shape) -- pearshaped
print(cornseed.color) -- yellow
```s
