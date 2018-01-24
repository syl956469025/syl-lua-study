--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2017/12/12
-- Time: 17:23
-- To change this template use File | Settings | File Templates.
--
local abstract = require("abstract")

ffi = {}

function ffi:new(name,age)
    local o = {}
    setmetatable(o,self)
    self.__index = self
    self.name = name
    self.age = age
end


