if Config.Framework ~= 'qb' then return end

local QB = exports['qb-core']:GetCoreObject()
if not QB then print('^1无法加载QB框架') return end

---获取框架姓名
---@param source number
---@return string
function GetPlayerFrameworkName(source)
    local charinfo = QB.Functions.GetPlayer(source)?.PlayerData.charinfo
    return ('%s %s'):format(charinfo?.firstname, charinfo?.lastname)
end
