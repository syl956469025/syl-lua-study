--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2018/1/4
-- Time: 11:28
-- To change this template use File | Settings | File Templates.
--
mymodule = {}



function mymodule:printTable()
    for k, v in pairs(self) do
        print(k .. ":" .. v)
    end
end

function mymodule:new(age,name)
    local o = {}
    setmetatable(o,{__index = self})
    o.age = age
    o.name = name
    return o;
end

return mymodule



