--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2017/12/13
-- Time: 16:57
-- To change this template use File | Settings | File Templates.
--
ngx.log(ngx.OK, "=============================")
local limit_req = require "resty.limit.req"
local lim, err = limit_req.new("my_limit_req_store", 1, 1)
ngx.log(ngx.OK, "=============================2")
if lim then
    ngx.log(ngx.OK, "------------------------正确------------------------------")
else
    ngx.log(ngx.OK, "------------------------false------------------------------")
end
if not lim then
    ngx.log(ngx.ERR, "failed to instantiate a resty.limit.req object:", err)
    return ngx.exit(500)
end
local key = ngx.var.binary_remote_addr
ngx.log(ngx.OK, key, "---------------------------")
local delay, err = lim:incoming(key, true)
if not delay then
    if err == "rejected" then
        ngx.log(ngx.OK, "rejected ---------------------------------")
        return ngx.exit(503)
    end
    ngx.log(ngx.ERR, "failed to limit req: ", err)
    return ngx.exit(500)
end
if delay >= 0.001 then
    local excess = err
    ngx.sleep(delay)

end
ngx.say("hello world lua!")

