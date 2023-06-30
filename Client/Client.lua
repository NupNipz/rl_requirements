local Core
if rlConfig.Inventory == "qb-inventory" then
    Core = exports["qb-core"]:GetCoreObject()
elseif rlConfig.Inventory == "ESX" then
    Core = exports["es_extended"]:getSharedObject()
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
                                ["Amount"] = Value["Amount"], 
                                ["Image"] = rlConfig.Inventory .. rlConfig.ImagePath .. Item .. ".png", 
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
                                ["Amount"] = Value["Amount"], 
                                ["Image"] = rlConfig.Inventory .. rlConfig.ImagePath .. Item .. ".png", 
                                ["Label"] = ItemData.label,
                            }
                        end
                    end
                end
            elseif rlConfig.Inventory == "ESX" then
                local ItemData = lib.callback.await("rl_requirements:Server:GetItem", false, Value["name"])
                if ItemData.count < Value["Amount"] then
                    Reqs[#Reqs + 1] = {
                        ["Amount"] = Value["Amount"], 
                        ["Image"] = "Images/" .. ItemData.name .. ".png", 
                        ["Label"] = ItemData.label,
                    }
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
