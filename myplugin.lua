-- 
-- myplugin.lua
-- Copyright (c) 2018 Corona Labs Inc. All rights reserved.
--
local lib

local platform = system.getInfo("platform")

if platform == 'html5' then
  lib = require("myplugin_js")
else
  -- Alert for non-HTML5 platforms
  error( "The '" .. lib.name .. "' library is not available on this platform." )
end

return lib