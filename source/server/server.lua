lib.locale()

local Items = exports.ox_inventory:Items()

---记录日志
---@param source number
---@param event string
---@param message string
function Logger(source, event, message)
    if not Config.Log then return end
    lib.logger(source, event, message)
end

local function tblToDDTags(tbl)
    local DDTags = ''
    for k, v in pairs(tbl) do
        DDTags = ('%s%s:%s,'):format(DDTags, k, v)
    end
    return DDTags
end

local function getEntityLabel(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    local entityType = GetEntityType(entity)

    if entityType == 1 then
        if IsPedAPlayer(entity) then
            return locale('player', GetPlayerFrameworkName(NetworkGetEntityOwner(entity)))
        else
            return locale('ped', GetEntityModel(entity))
        end
    elseif entityType == 2 then
        return locale('vehicle', GetVehicleNumberPlateText(entity))
    elseif entityType == 3 then
        return locale('entity', GetEntityModel(entity))
    else
        return locale('unknown')
    end
end

local function getWeaponLabel(hash)
    for _, v in pairs(Items) do
        if v.hash and v.hash & 0xFFFFFFFF == hash then
            return v.label
        end
    end
    return hash
end

if Config.WeaponDamage then
    AddEventHandler('weaponDamageEvent', function(sender, data)
        lib.logger(sender, 'weaponDamageEvent', GetPlayerFrameworkName(sender), tblToDDTags({
            hitEntityLabel = getEntityLabel(data.hitGlobalId),
            silenced = data.silenced,
            weaponDamage = data.weaponDamage,
            weaponLabel = getWeaponLabel(data.weaponType),
            willKill = data.willKill,
        }))
    end)
end

if Config.ChatMessage then
    RegisterServerEvent('_chat:messageEntered', function(author, color, message, mode)
        local _source = source
        lib.logger(_source, 'chatMessage', message, tblToDDTags({
            name = GetPlayerFrameworkName(_source),
        }))
    end)
end

if Config.PlayerJoinQuit then
    AddEventHandler('playerJoining', function()
        local _source = source
        lib.logger(_source, 'playerJoining', '', tblToDDTags({
            name = GetPlayerFrameworkName(_source),
        }))
    end)

    AddEventHandler('playerDropped', function(reason)
        local _source = source
        lib.logger(_source, 'playerDropped', reason, tblToDDTags({
            name = GetPlayerFrameworkName(_source),
        }))
    end)
end
