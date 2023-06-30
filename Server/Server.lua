local rl =
if rlConfig.Inventory == "ESX" then
    rl = exports["es_extended"]:getSharedObject()
    if rlConfig.UseOxLib then
        lib.callback.register(
            "rl_requirements:Server:GetItem",
            function(Source, ItemLabel)
                local Source = Source
                local Player = rl.GetPlayerFromId(Source)
                if not Player then
                    return
                end

                for Key, Value in pairs(Player.getInventory()) do
                    if ItemLabel == Value.label then
                        return Player.hasItem(Value.name)
                    end
                end
            end
        )
    else
        ESX.RegisterServerCallback(
            "rl_requirements:Server:GetItem", 
            function(Source, Callback, ItemLabel)
                local Source = Source
                local Player = rl.GetPlayerFromId(Source)
                if not Player then
                    return
                end

                for Key, Value in pairs(Player.getInventory()) do
                    if ItemLabel == Value.label then
                        Callback(Player.hasItem(Value.name))
                    end
                end
            end
        )
    end
end