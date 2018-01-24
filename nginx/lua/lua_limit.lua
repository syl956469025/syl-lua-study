--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2018/1/2
-- Time: 14:47
-- To change this template use File | Settings | File Templates.
--

local count = 2;
local writemember = "whitemember"
local ip = ngx.var.remote_addr
--
--  建立redis连接
--
function cache()
    local redis = require "resty.redis"
    local red = redis:new()
    red:set_timeout(1000)
    local ok,err = red:connect("192.168.52.101",6379)
    if not ok then
        ngx.exit("failed to connect:",err)
        return
    end
    return red;
end


--
--  判断是否是白名单中的ip
--
function iswhiteMem(red)
    local exist = red:sismember(writemember,ip)
    if exist then
        print("this ip is exist")
        return true
    end
    ngx.say(ip)
    return false
end

--
--  记录ip的访问次数，并判断是否已经超过上限
--
function limit(red)
    local i,e = red:incr(ip)
    if not i then
        return false
    end
    if i == 1 then
        red:expire(ip,2) -- 2秒
    elseif i > count then
        print("i is bigger then " .. count)
        return false
    end
    return true
end

--
--  释放redis连接到连接池中
--
function releaseConn(red)
    local ok, err = red:set_keepalive(4000, 100)
    if not ok then
        print("failed to set keepalive: ", err)
        return
    end
end



local redis = cache()
local white = iswhiteMem(redis)
if not white then
    result = limit(redis)

end
releaseConn(redis)
if not result then
    print("-------------------")
    ngx.exit(ngx.HTTP_SERVICE_UNAVAILABLE)
end













