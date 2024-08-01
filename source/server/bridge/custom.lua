if Config.Framework ~= 'custom' then return end

---获取框架姓名
---@param source number
---@return string
function GetPlayerFrameworkName(source)
    return GetPlayerName(source)
end
