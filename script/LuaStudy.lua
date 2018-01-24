--
-- Created by IntelliJ IDEA.
-- User: Mtime
-- Date: 2017/11/28
-- Time: 14:44
-- To change this template use File | Settings | File Templates.
--
--m = require("Module")



--[[
    lua 数据类型
    1. nil
    2. boolean
    3. number
    4. string
    5. function  函数
    6. userdata  c数据结构
    7. thread    用于执行协同程序
    8. table     {}

 ]]

-- 关系运算符
--[[
-- == 等于
-- ~= 不等于
--

 ]]

--print(os.date("`yeart`"))
--
--print(coroutine.running())
--local co = coroutine.create(function(i)
--    print(i)
--    print(coroutine.running())
--    coroutine.yield()
--    print("============")
--end)
--coroutine.resume(co,1)
--print(coroutine.status(co))
--print(coroutine.running())
--coroutine.resume(co)
--print("----------------------------")
--print(coroutine.status(co))
--print(coroutine.running())




--local wc = coroutine.wrap(function(e)print(e) end)
--wc("zhangsan")

--co2 = coroutine.create(function(a)
--    for i = 1, 10 do
--        print(i)
--        if i == 3 then
--            print("ddd")
--            print(coroutine.status(co2))
--            print(coroutine.running())
--        end
--        yield = coroutine.yield(5)
--        print(yield)
--    end
--end)
--coroutine.resume(co2) --1
--coroutine.resume(co2) --2
--coroutine.resume(co2) --3
--coroutine.resume(co2) --3

--print(coroutine.status(co2))   -- suspended
--print(coroutine.running())

--function foo(a)
--    print("foo func output",a)
--    return coroutine.yield(a*2)
--end
--
--local co = coroutine.create(function(a,b)
--    print("first time",a,b)
--    local r = foo(a+1)
--    print("second time",r)
--    local r,s = coroutine.yield(a+b,a-b)
--    print(" third time ",r,s)
--    return b," process end "
--end)
--
--print("main1",coroutine.resume(co,1,10))
--print("-------------------------")
--
--print("main2",coroutine.resume(co,"r"))
--print("-------------------------")
--print("main3",coroutine.resume(co,"x","y"))
--print("-------------------------")
--print("main4",coroutine.resume(co,"x","y"))
--
--
--
--local newProducter
--
--function product()
--    local i = 0
--    while true do
--        local feedback = send(i)
--        if not feedback then
--            break
--        end
--        i = i+1
--    end
--end
--
--
--
--function consumer()
--    local boolean feedback = true
--    local count = 0
--    while true do
--        if count > 100 then
--            feedback = false
--        end
--        local receive = receive(feedback)
--        if not receive then
--            break
--        end
--        print("receive: " .. receive)
--        count = count + 1
--    end
--end
--
--function receive(feedback)
--    local status,value = coroutine.resume(newproducter,feedback)
--- -    print(status .. value)
-- return value
-- end
--
-- function send(i)
-- print("-------------------")
-- local feedback = coroutine.yield(i)
-- return feedback
-- end
--
-- newproducter = coroutine.create(product)
-- print(type(newproducter))
-- print(coroutine.status(newproducter))
---- consumer()

--local file = io.open("test.txt","a+")
--file:write("zhangsan")
--file:flush()
--file:seek("set",0)
--print(file:read("*l"))
--file:close()
--for line in io.lines("test.txt") do
--    print(line)
--end
--
--function test(a,b)
--    assert(type(a) == "number","a is not a number")
--    if type(b) ~= "number" then
--        error("b is not a number",0)
--    end
--    print(a+b)
--end
--
--test(1,"a")
--
--local result,errorinfo = pcall(test,1,"a")
--
--if result then
--    print("correct")
--else
--    print("error",errorinfo)
--end

--local result,error = pcall(test,1,"a")
--if result then
--    print("correct")
--else
--    print("error",error)
--end
--function er(err)
--    print(err)
--    print(debug.traceback())
--end
--local result = xpcall(test,er,1,"a")
--if result then
--    print("correct")
--else
--    print("error")
--end

--function test()
--    print(debug.traceback("stack trace"))
--    print(debug.getinfo(1))
--end
--
--test()
--print(debug.getinfo(1))

--function newCounter()
--    local n = 0
--    local k = 0
--    return function()
--        n = n + 1
--        k = n
--        return n
--    end
--end
--
--counter = newCounter()
--print(counter())
--
--name,val = debug.getupvalue(counter,1)
--print("index",1,name,"=",val)
--print(counter())
--name,val = debug.getupvalue(counter,2)
--print("index",2,name,"=",val)
--
--debug.setupvalue(counter,1,20)
--print(counter())





--local i = 1
--repeat
--    name,val = debug.getupvalue(counter,i)
--    if name then
--        print("index",i,name,"=",val)
--        if name == "n" then
--            debug.setupvalue(counter,2,10)
--        end
--        i = i + 1
--    end
--until not name
--print(counter())
--
--
--Rectangle = { area = 0, length = 11, breadth = 0 }
--
--function Rectangle:new(length, breadth)
--    local o = {}
--    setmetatable(o, self)
--    self.__index = self
----    self.length = length
--    self.breadth = breadth
--    self.area = self.length * self.breadth
--    return o
--end
--function Rectangle:printArea()
--    print("area: ",self.area)
--end
--
--r = Rectangle:new(10,20)
--e = Rectangle:new(7,20)
--r:printArea()
--e:printArea()
--
--print(r.length)
--
--Shape = {area = 0 }
--function Shape:new(side)
--    local o = {}
--    setmetatable(o,self)
--    self.__index = self
--    side = side or 0
--    self.area = side * side
--    return o
--end
--function Shape:printArea()
--    print("area : ",self.area)
--end
--
--
--Square = Shape:new()
--function Square:new(side)
--    local o = Shape:new(side)
--    setmetatable(o,self)
--    self.__index= self
--    return o
--end
--
--function Square:printArea()
--    print("zhangsan: ",self.area)
--end
--
--sq = Square:new(5)
--s = Shape:new(10)
--sq:printArea()
--
--local RectAngle = {length,width,area,test="zhangsan" }
--function RectAngle:new(len,wid)
--    local o ={
--        length = len,
--        width = wid,
--        area = len*wid
--    }
--    setmetatable(o,{__index=self})
--    return o
--end
--
--function RectAngle:getinfo()
--    return self.length,self.width,self.area,self.test
--end
--
--r = RectAngle:new(10,20)
--print(r:getinfo())
--e = RectAngle:new(10,10)
--print(e:getinfo())
--print(r:getinfo())

--mytable = {d="d"}
--_M = {a="1",b="2",c="3"}
--setmetatable(_M,{__index=function(self,method)
--    return function (self, ...)
--        print(#{...})
--        return method;
--    end
--end,__newindex=mytable})
--print(_M["d"])
--_M["f"]="zhaoliu"
--_M["b"]="wangwu"
--for k, v in pairs(_M) do
--    print(k .. ":" .. v)
--end
--
--print(_M:sylshi("sfsdf"))

--function test()
--    error("throw a exception",2)
--end
--
--function errprint()
--    print(debug.traceback())
--end

--if pcall(test) then
--    print("no error")
--else
--    print("error")
--    print(debug.traceback())
--end

--xpcall(test,errprint)
--local m = require "mymodule"
--local zs = m:new(10,"zhangsan")
--local ls = m:new(9,"lisi")
--ls:printTable()
--zs:printTable()

--function test(num)
--    print(num)
--    error("this is not a number")
--    return "a"
--end

--local result,errorinfo = pcall(test,1)
--
--if result then
--    print("correct")
--else
--    print("error",errorinfo)
----    print(debug.traceback())
--end
--
--local succ,new_tab = pcall(require,"table.new")
--if not succ then
--    new_tab = function()return {} end
--end
--local _M = new_tab(0,5)
--print(type(_M))
--print(#_M)
--for k , v in pairs(_M) do
--    print(k)
--    print(v)
--end






--function er(err)
--    print(err)
--    print(debug.traceback())
--end
--local result,r = xpcall(test,er,1)
--if result then
--    print("correct")
--else
--    print("error")
--end
--print(r)

--mytable = {}
--n = {}
--mymetatable = {__index=function(tab,key)
--    if key == "key" then
--        return "metatable"
--    else
--        return nil
--    end
--end,__newindex=n}
--setmetatable(mytable,mymetatable)
--print(mytable.index)
--
--rawset(mytable,"key","value")
--print(mytable.key)
--mytable.zhang="san"
--print(n.zhang)
--
--mytable = {}
--
--metatable = {key="value",key3="value3"} -- 元
--
--setmetatable(mytable,metatable)
--
--table = setmetatable({},{__index=metatable,__newindex=metatable })
--
--
--
--print(table.key)
--print(metatable.key)
--rawset(table,"key","value2")
--print(table.key)
--print(metatable.key)
--print(rawget(table,"key3"))

local test = require "test"

local zhang = test:new("women","2017")

zhang:printTable()
local lisi = test:new("men","2016")
lisi:printTable()





















































