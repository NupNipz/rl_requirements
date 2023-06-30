fx_version "cerulean"
game "gta5"
lua54 "yes"

shared_scripts { -- Uncomment this if using ox_lib while using ESX
    -- "@ox_lib/init.lua", 
}

client_scripts {
    "Config.lua",
    "Client/Client*.lua",
} 

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "Server/Server.lua",
}

ui_page "html/Index.html"

files {
    "html/Index.html",
    "html/Script.js",
    "html/Style.css",
    "html/Images/*.png"
}