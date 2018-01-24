--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2018/1/4
-- Time: 17:53
-- To change this template use File | Settings | File Templates.
--
newmodule = {}

newmodule.memberNo = "dfsdf"

local function printTable(table)
    for k, v in pairs(table) do
        print("k:" .. k .. "," .. "v:" .. v)
    end
end

function newmodule.pr(table)
    printTable(table)
end

return newmodule

