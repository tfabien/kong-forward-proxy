local access = require "kong.plugins.forward-proxy.access"

local plugin = require("kong.plugins.base_plugin"):extend()
local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")

plugin.PRIORITY = 1000

function plugin:new()
  plugin.super.new(self, plugin_name)
end

function plugin:access(plugin_conf)
  plugin.super.access(self)
  access.execute(plugin_conf)
end

return plugin
