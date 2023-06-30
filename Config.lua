rlConfig = {}
rlConfig.Inventory = "ESX" -- qb-inventory, ox_inventory or ESX
rlConfig.ImagePath = "/web/images/" -- Image path, ur inventory name will be pasted in front by the script.

-- ESX related
-- If ur using ESX make sure you place item images in the (Image) folder, located in the (HTML) folder. otherwise boxes will be displayed without any image
rlConfig.UseOxLib = true -- If true it will use ox_lib callback, else it will use ESX callbacks