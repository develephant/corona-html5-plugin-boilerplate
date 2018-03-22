-- 
-- myplugin.lua
-- Copyright (c) 2018 Corona Labs Inc. All rights reserved.
--
local lib

local platform = system.getInfo("platform")

if platform == 'html5' then
  lib = require("myplugin_js")
else
	-- wrapper for non web platforms
	local CoronaLibrary = require "CoronaLibrary"
	-- Create stub library for simulator
	lib = CoronaLibrary:new{ name='myplugin', publisherId='com.me' }
  -- Alert for non-HTML5 platforms
	local function defaultFunction()
		print( "WARNING: The '" .. lib.name .. "' library is not available on this platform." )
  end
  
  lib.echo = defaultFunction
end

return lib