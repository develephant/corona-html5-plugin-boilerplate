# Corona HTML5 Plugin Boilerplate

A dry structure to build Corona HTML5 plugins.

## Direct Communication

__JavaScript__

```js
window.myplugin_js = 
{
  echo: function(str) {
    return str
  }
};
```

__Lua__

```lua
local myplugin = require("myplugin")

local result = myplugin.echo("Hello")

print(result) --> Hello
```

## Event Listeners

__JavaScript__

```js
window.myplugin_js = 
{
  echo: function(str) {
    this.dispatchEvent({name: 'echo', value: str})
  }
}
```

__Lua__

```lua
local myplugin = require("myplugin")

local function echoListener(event)
  event = json.decode(event)

  print(event.value) --> Hello
end

myplugin.addEventListener(echoListener)

myplugin.echo("Hello")
```