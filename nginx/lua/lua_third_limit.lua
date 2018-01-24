--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2018/1/2
-- Time: 19:01
-- To change this template use File | Settings | File Templates.
--

local limit_req = require "resty.limit.req"
-- 限制请求速率为 200r/s , 并且允许另外100r/s的突发请求
-- 在 200r/s 至 300r/s 之间的请求会被延迟
-- 在超过 300r/s 以后请求会被拒绝
local lim,err = limit_req.new("my_limit_req_store",200,100)
if not lim then
    ngx.log(ngx.ERR,"初始化 resty.limit.req 对象失败:",err)
    return ngx.exit(500)
end

--
--
local key = ngx.var.binary_remote_addr
-- key这里是指需要限流的ip；commit真心没看懂，先按照例子传true
-- 如果请求没超过速率，那么delay和err返回0
-- 如果请求超过速率但没超过“速率+burst”的值，
-- 那么delay将会返回一个合适的秒数，告诉你多久后这个请求才会被处理；
-- 第二个参数(err)保存着超过请求速率的请求数量
-- 如果请求超过“速率+burst”的值，那么delay会返回nil，err会返回”rejected”字符串
-- 如果一个error发生了，delay会返回nil，err会返回具体错误的字符串描述
local delay,err = lim:incoming(key,true)
ngx.log(ngx.ERR,"参数==delay ：",delay,"   ",err)
if not delay then
    --ngx.log(ngx.ERR,"==delay ：",delay,"   ",err)
    if err == "rejected" then
        --ngx.log(ngx.ERR,"请求被拒绝: ",err)
        return ngx.exit(503)
    end
    ngx.log(ngx.ERR,"failed to limit req: ",err)
    return  ngx.exit(500)
end

if delay > 0.001 then
    local excess =err
    --ngx.log(ngx.ERR,"请求数：",excess)
    ngx.sleep(delay)
end



