local url = require "net.url"

local _M = {}

function _M.execute(plugin_conf)
  local u = url.parse(ngx.ctx.api.upstream_url)
  ngx.var.upstream_host=u.host  
  ngx.ctx.balancer_address.host = plugin_conf.proxy_host
  ngx.ctx.balancer_address.port = plugin_conf.proxy_port 
end

return _M