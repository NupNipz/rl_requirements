local Core
if rlConfig.Framework == "qb-core"then
    Core = exports[rlConfig.Framework]:GetCoreObject()
end

exports(
    "ShowRequirements", 
    function(Requirements) 
        local Reqs = {}
        for Key, Value in pairs(Requirements) do
            if rlConfig.Inventory == "qb-inventory" then
                for Item, ItemData in pairs(Core.Shared.Items) do
                    if Value["Label"] == ItemData["label"] then
                        if not Core.Functions.HasItem(Item, Value["Amount"]) then
                            Reqs[#Reqs + 1] = { 
                                ["Amount"] = 1, 
                                ["Image"] = "qb-inventory/html/images/" .. Item .. ".png", 
                                ["Label"] = ItemData.label,
                            }
                        end
                    end
                end
            elseif rlConfig.Inventory == "ox_inventory" then
                for Item, ItemData in pairs(exports.ox_inventory:Items()) do
                    if Value["Label"] == ItemData["label"] then
                        local ItemCount = exports.ox_inventory:Search("count", Item)
                        if ItemCount < Value["Amount"] then
                            Reqs[#Reqs + 1] = {
                                ["Amount"] = 1, 
                                ["Image"] = "ox_inventory/web/images/" .. Item .. ".png", 
                                ["Label"] = ItemData.label,
                            }
                        end
                    end
                end
            end
        end

        SendNUIMessage({
            Action = "SetRequirements", 
            Display = true,
            Requirements = Reqs
        })
    end
)        

exports(
    "HideRequirements",
    function()
        SendNUIMessage({
            Action = "SetRequirements", 
            Display = false,
        })
    end
)