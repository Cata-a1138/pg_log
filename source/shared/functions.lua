local function isResourceStartedOrStarting(resource)
    local state = GetResourceState(resource)
    return state == 'started' or state == 'starting'
end

-- 自动检测框架
if Config.Framework == 'auto' then
    if isResourceStartedOrStarting('es_extended') then
        Config.Framework = 'esx'
    elseif isResourceStartedOrStarting('qb-core') then
        Config.Framework = 'qb'
    else
        Config.Framework = 'custom'
    end
end
