--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2018/1/2
-- Time: 14:26
-- To change this template use File | Settings | File Templates.
--


local redis = require "resty.redis"
local red = redis:new()
red:set_timeout(1000)
local ok,err = red:connect("192.168.52.101",6379)
if not ok then
    ngx.say("failed to connect:",err)
    return
end

ok ,err = red:set("dog","an animal")
if not ok then
    ngx.say("failed to set dog: ", err)
    return
end
ngx.say("set result: ", ok)

local res, err = red:get("dog")
if not res then
    ngx.say("failed to get dog: ", err)
    return
end

if res == ngx.null then
    ngx.say("dog not found.")
    return
end

ngx.say("dog: ", res)
