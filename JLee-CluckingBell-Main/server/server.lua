local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem("coffee", function(source, item)
    local src = source
    TriggerClientEvent("JLee-CluckingBell:Drink", src, "coffee", "Coffee", "amb@world_human_drinking@coffee@male@idle_a", "idle_a", 'prop_mug_02', 28422, { x=0.01, y=-0.01, z=-0.00 }, Config.Thirst["Coffee"], false, true)
end)

QBCore.Functions.CreateUseableItem("sprite", function(source, item)
    local src = source
    TriggerClientEvent("JLee-CluckingBell:Drink", src, "sprite", "Sprite", "amb@world_human_drinking@coffee@male@idle_a", "idle_a", 'prop_plastic_cup_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["Sprite"], true, false)
end)

QBCore.Functions.CreateUseableItem("cocacola", function(source, item)
    local src = source
    TriggerClientEvent("JLee-CluckingBell:Drink", src, "cocacola", "CocaCola", "amb@world_human_drinking@coffee@male@idle_a", "idle_a", 'prop_plastic_cup_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["CocaCola"], true, false)
end)

QBCore.Functions.CreateUseableItem("pepper", function(source, item)
    local src = source
    TriggerClientEvent("JLee-CluckingBell:Drink", src, "pepper", "DR.Pepper", "amb@world_human_drinking@coffee@male@idle_a", "idle_a", 'prop_plastic_cup_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["DRPepper"], true, false)
end)


QBCore.Functions.CreateUseableItem("chickenwrap", function(source, item)
    local src = source
    TriggerClientEvent("JLee-CluckingBell:Eat", src, false, "chickenwrap", 'Chicken Wrap', Config.Locals['Progressbar']['Eating']['Time'], Config.Hunger["ChickenWrap"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'prop_taco_02', 18905, { x=0.12, y=0.03, z=0.04 })
end)

QBCore.Functions.CreateUseableItem("spicychickenwrap", function(source, item)
    local src = source
    TriggerClientEvent("JLee-CluckingBell:Eat", src, false, "spicychickenwrap", 'Spicy Chicken Wrap', Config.Locals['Progressbar']['Eating']['Time'], Config.Hunger["SpicyChickenWrap"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'prop_taco_02', 18905, { x=0.12, y=0.03, z=0.04 })
end)


QBCore.Functions.CreateUseableItem("chickenwings", function(source, item)
    local src = source
    TriggerClientEvent("JLee-CluckingBell:Eat", src, false, "chickenwings", 'Chicken Wings', Config.Locals['Progressbar']['Eating']['Time'], Config.Hunger["ChickenWings"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'prop_cs_plate_01', 60309, { x=0.02, y=0.05, z=0.02 })
end)

QBCore.Functions.CreateUseableItem("popcornchicken", function(source, item)
    local src = source
    TriggerClientEvent("JLee-CluckingBell:Eat", src, false, "popcornchicken", 'Popcorn Chicken', Config.Locals['Progressbar']['Eating']['Time'], Config.Hunger["ChickenWings"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'prop_cs_plate_01', 60309, { x=0.02, y=0.05, z=0.02 })
end)

QBCore.Functions.CreateUseableItem("chickenburger", function(source, item)
    local src = source
    TriggerClientEvent("JLee-CluckingBell:Eat", src, false, "chickenburger", 'Chicken Burger', Config.Locals['Progressbar']['Eating']['Time'], Config.Hunger["ChickenWings"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'prop_cs_plate_01', 60309, { x=0.02, y=0.05, z=0.02 })
end)

QBCore.Functions.CreateCallback('JLee-CluckingBell:CheckDuty', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.onduty then
        cb(true)
    else
        cb(false)
	end
end)


RegisterServerEvent("JLee-CluckingBell:RemoveItem", function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local GetItem = Player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        if amount then
            Player.Functions.RemoveItem(item, amount, false)
        else
            Player.Functions.RemoveItem(item, GetItem.amount, false)
        end
    end
end)

RegisterServerEvent("JLee-CluckingBell:AddItem", function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(item, amount, false)
end)

QBCore.Functions.CreateCallback('JLee-CluckingBell:HasItem', function(source, cb, item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local GetItem = Player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        if amount then
            if GetItem.amount >= amount then
                cb(true)
            else
                cb(false)
            end        
        else
            if GetItem.amount then
                cb(true)
            else
                cb(false)
            end
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('JLee-CluckingBell:CheckForChickenWrapItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rawchicken = Player.Functions.GetItemByName("rawchicken")
    local lettuce = Player.Functions.GetItemByName("lettuce")
    local wrap = Player.Functions.GetItemByName("wrap")
    if rawchicken ~= nil and lettuce ~= nil and wrap ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('JLee-CluckingBell:CheckForSpicyChickenWrapItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rawchicken = Player.Functions.GetItemByName("rawchicken")
    local lettuce = Player.Functions.GetItemByName("lettuce")
    local wrap = Player.Functions.GetItemByName("wrap")
    local hotsauce = Player.Functions.GetItemByName("hotsauce")
    if rawchicken ~= nil and lettuce ~= nil and wrap ~= nil and hotsauce ~= nil then
        cb(true)
    else
        cb(false)
	end
end)



QBCore.Functions.CreateCallback('JLee-CluckingBell:CheckForChickenWingsItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local wings = Player.Functions.GetItemByName("rawchicken")
    local flour = Player.Functions.GetItemByName("flour")
    local butter = Player.Functions.GetItemByName("butter")
    if wings ~= nil and flour ~= nil and sauce ~= nil  then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('JLee-CluckingBell:CheckForPopcornChickenItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rawchicken = Player.Functions.GetItemByName("rawchicken")
    local flour = Player.Functions.GetItemByName("flour")
    local butter = Player.Functions.GetItemByName("butter")
    local sauce = Player.Functions.GetItemByName("hotsauce")
    if rawchicken ~= nil and flour ~= nil and sauce ~= nil and butter ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

QBCore.Functions.CreateCallback('JLee-CluckingBell:CheckForChickenBurgerItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rawchicken = Player.Functions.GetItemByName("rawchicken")
    local breadbun = Player.Functions.GetItemByName("breadbun")
    local lettuce = Player.Functions.GetItemByName("lettuce")
    if rawchicken ~= nil and breadbun ~= nil and lettuce ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

function DiscordLog(message)
    local embed = {
        {
            ["color"] = 04255, 
            ["title"] = "JLee CluckingBell",
            ["description"] = message,
            ["url"] = "https://discord.gg/rExc97jFFY",
            ["footer"] = {
                ["text"] = "By JLee",
                ["icon_url"] = Config.LogsImage
            },
            ["thumbnail"] = {
                ["url"] = Config.LogsImage,
            },
        }
    }
    PerformHttpRequest(Config.WebHook, function(err, text, headers) end, 'POST', json.encode({username = 'JLee-CluckingBell', embeds = embed, avatar_url = Config.LogsImage}), { ['Content-Type'] = 'application/json' })
end