--[[ FX Information ]]--
fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

--[[ Resource Information ]]--
author 'Cata_a <3478600437@qq.com>'
version '1.0.0'
description '日志记录'

--[[ Manifest ]]--
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'source/shared/functions.lua',
}

server_scripts {
    'source/server/bridge/*.lua',
    'source/server/server.lua',
}

files {
    'locales/*.json',
}
