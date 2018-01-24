--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2018/1/24
-- Time: 14:46
-- To change this template use File | Settings | File Templates.
--


test = {name="zhangsan",age=19}

function test:printTable()
    for k, v in pairs(self) do
        print( k .. ":" .. v  )
    end
end

function test:new(gendar,birthday)
    local o = {}
    setmetatable(o,{__index=self})
    o.gendar = gendar
    o.birthday = birthday
    return o;
end

return test





