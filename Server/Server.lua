local rl
if rlConfig.Inventory == "ESX" then
    rl = exports["es_extended"]:getSharedObject()
    lib.callback.register(
        "rl_requirements:Server:GetItem",
        function(Source, ItemLabel)
            local Source = Source
            local Player = rl.GetPlayerFromId(Source)
            if not Player then
                return
            end

            for Key, Value in pairs(Player.getInventory()) do
                if ItemLabel == Value.name then
                    return Player.hasItem(Value.name)
                end
            end

            return nil
        end
    )
end