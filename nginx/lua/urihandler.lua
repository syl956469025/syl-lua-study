--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2018/1/19
-- Time: 18:35
-- To change this template use File | Settings | File Templates.
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
--  释放redis连接到连接池中
--
function releaseConn(red)
    local ok, err = red:set_keepalive(4000, 100)
    if not ok then
        print("failed to set keepalive: ", err)
        return
    end
end

function get(red,key)
    local value = red:get(key)
    ngx.log(ngx.OK,"key :  ",key,"   value : ",value)
    return value;
end

ngx.log(ngx.OK,ngx.var.uri);
local uri = ngx.var.uri;
local m, err = ngx.re.match(uri, "\\/(\\d+?)\\.\\w+");
if(m) then
    ngx.log(ngx.OK,"address match success then connect redis === ",m[1])
    local redis = cache();
    local realurl = get(redis,m[1]);
    releaseConn(redis)
    ngx.var.realurlcus = realurl;
    ngx.log(ngx.OK,"realuri :",ngx.var.realurlcus);
else
    ngx.req.set_uri(ngx.var.uri, false);
end

