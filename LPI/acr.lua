mt = getrawmetatable(game)

IsBlackListed = function(scpt) 
    
    for _,v in next,_G.BlackListedScripts do 
    
        if tostring(scpt) == v then return true end    
        
    end    
    
    return false
    
end

setreadonly(mt, false)

old = mt.__index

mt.__index = newcclosure(function(t,k,...)
    scpt = getfenv(2).script
    if IsBlackListed(scpt) then
        if _G.Dev then
            print('CallerLocation : '..scpt:GetFullName())
            print('Main : '..tostring(t))
            print('Method : '..tostring(k))
            print(...)
        end
        return nil
    end
   return old(t,k,...)
end)