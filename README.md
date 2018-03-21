# Corona HTML5 Plugin Boilerplate

A dry structure to build Corona HTML5 plugins.

## Direct Communication

```js
window.myplugin_js = 
{
  echo: function(str) {
    return str
  }
};
```

```lua
local myplugin = require("myplugin")

local result = myplugin.echo("Hello")

print(result) --> Hello
```

## Event Listeners

```js
window.myplugin_js = 
{
  echo: function(str) {
    this.dispatchEvent({name: 'echo', value: str})
  }
}
```

```lua
local myplugin = require("myplugin")

local function echoListener(event)
  event = json.decode(event)
  
  print(event.value) --> Hello
end

myplugin.addEventListener(echoListener)

myplugin.echo("Hello")
```