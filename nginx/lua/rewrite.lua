--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2017/12/13
-- Time: 17:45
-- To change this template use File | Settings | File Templates.
--
require "ngx"

local redirect = ngx.redirect
local ok = ngx.OK

function rewrite(arg)
    ngx.log(ngx.OK,"===============================" .. type(arg) .. "table length: ",#arg)
    for i, k in pairs(arg) do
        ngx.log(ngx.OK,"参数Index: " .. i .. " value: " .. k)
    end
    local h = ngx.resp.get_headers()
    for k, v in pairs(h) do
        ngx.log(ngx.OK,"参数Index: " .. k .. " value: " .. v)
    end
    ngx.log(ngx.OK,"参数Index: Host value: " .. ngx.var.remote_addr)
--    local z = ngx.var.zhangsan;
--    ngx.log(ngx.OK,"参数Index: zhangsan value: " .. z)
end

rewrite(ngx.req.get_uri_args())

