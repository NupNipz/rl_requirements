fx_version "cerulean"
game "gta5"
lua54 "yes"

shared_scripts {
    "@ox_lib/init.lua",
    "Config.lua",
}

client_scripts{
    "Client/Client*.lua",
} 

ui_page "html/Index.html"

files {
    "html/Index.html",
    "html/Script.js",
    "html/Style.css"
}