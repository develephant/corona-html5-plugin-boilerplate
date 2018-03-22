# Corona HTML5 Plugin Boilerplate

A dry structure to build Corona HTML5 plugins.

## Overview

 - Plugin files must reside in the ___root___ directory.
 - Plugin files are compiled with the HTML5 build.
 - JS file must be named `<myplugin>_js.js` to work.
 - Lua file must be named `<myplugin>.lua` to work.
 - Refs to `myplugin` inside files must be changed to your plugin name.
 - Refs to `<myplugin>_js` inside files must be changed to your plugin name.

_Replace <myplugin\> with your plugin name._

## Direct Communication

__JavaScript__

_Window property must be named `<myplugin>_js`. Replace <myplugin\> with your plugin name._

```js
window.myplugin_js = 
{
  echo: function(str) {
    return str
  }
};
```

__Lua__

_Replace references to `myplugin` with your plugin name._

```lua
local myplugin = require("myplugin")

local result = myplugin.echo("Hello")

print(result) --> Hello
```

## Event Driven

__JavaScript__ (dispatcher)

_Window property must be named `<myplugin>_js`. Replace <myplugin\> with your plugin name._

```js
window.myplugin_js = 
{
  echo: function(str) {
    this.dispatchEvent({name: 'echo', value: str})
  }
}
```

__Lua__ (event listener)

_Replace references to `myplugin` with your plugin name._

```lua
local myplugin = require("myplugin")

local function echoListener(event)
  event = json.decode(event)

  print(event.value) --> Hello
end

myplugin.addEventListener(echoListener)

myplugin.echo("Hello")
```

## Parameter Types

### Lua to JS

 - Number
 - String
 - Boolean
 - Array (table) -> Json
 - Table -> Json

 ### JS to Lua

 - Number
 - String
 - Boolean
 - Array (json) -> Table (array)
 - Object (json) -> Table

 ## Notes

  - To see Lua `print` output you must run the _index-debug.html_.