--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2018/1/17
-- Time: 17:17
-- To change this template use File | Settings | File Templates.
--

function hand(args)
    local uri = args[1]
    ngx.log(ngx.OK,  uri)
    local u = ngx.arg[1]
    ngx.log(ngx.OK,  u)
end

hand()


