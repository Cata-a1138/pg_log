if Config.Framework ~= 'esx' then return end

local res, esx = pcall(function()
    return exports.es_extended:getSharedObject()
end)
if res then
    ESX = esx
else
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    if not ESX then print('^1无法加载ESX框架') return end
end

---获取框架姓名
---@param source number
---@return string
function GetPlayerFrameworkName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getName()
end
