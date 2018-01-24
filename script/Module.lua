--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2017/12/4
-- Time: 13:15
-- To change this template use File | Settings | File Templates.
--
module = {}

module.constant = " this is a constant! "

function module.add(val1,val2)
    return val1 + val2
end

local function add2(val1,val2)
    return val1 + val2
end

function module.add3(val1,val2)
    return add2(val1,val2)
end

return module

