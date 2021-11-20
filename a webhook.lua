repeat 
	wait() 
until game:IsLoaded() 
---------------------------
_G.webhook = true
_G.FruitMasLock = true
----------------------------

join = game.Players.localPlayer.Neutral == false
repeat wait()
    join = game.Players.localPlayer.Neutral == false
until join
warn("WebHook is loaded")
checkmll203 = 0
coror = 0
melein2021 = ""
local yourlv = game.Players.LocalPlayer.Data.Level.Value
local devifut = game.Players.LocalPlayer.Data.DevilFruit.Value
allit3 = ""

if _G.webhook == true then
    spawn(function()
        while wait(1) do
            coror += 1
            if coror == 1 then -- red
                colonow1 = 0xfc172a 
            elseif coror == 2 then -- blue
                colonow1 = 0x8acae7
            elseif coror == 3 then -- green
                colonow1 = 0x03cd8c
            elseif coror == 4 then  --yenlo
                colonow1 = 0xcad759
            end
            if coror > 4 then
                coror = 0
            end
        end
    end)
while wait(30) do
    pcall(function()
        local yourlv = game.Players.LocalPlayer.Data.Level.Value
        local devifut = game.Players.LocalPlayer.Data.DevilFruit.Value  
        if _G.FruitMasLock then
            if devifut == ("Dark-Dark") then
                FruitMasLock = 115
            elseif devifut == ("Quake-Quake") then
                FruitMasLock = 155
            elseif devifut == ("Human-Human: Buddha") then
                FruitMasLock = 205
            elseif devifut == ("Rumble-Rumble") then
                FruitMasLock = 255
            elseif devifut == ("Venom-Venom") then
                FruitMasLock = 305
            elseif devifut == ("Dragon-Dragon") then
                FruitMasLock = 355
            elseif devifut == ("String-String") then
                FruitMasLock = 230
            elseif devifut == ("Shadow-Shadow") then
                FruitMasLock = 305
            else
                FruitMasLock = 200
            end
        else
            FruitMasLock = 150
        end
            
        if yourlv >= 2100 and ((game.Players.LocalPlayer.Backpack:FindFirstChild(devifut) and game.Players.LocalPlayer.Backpack:FindFirstChild(devifut).Level.Value >= FruitMasLock) or (game.Players.LocalPlayer.Character:FindFirstChild(devifut) and game.Players.LocalPlayer.Character:FindFirstChild(devifut).Level.Value >= FruitMasLock)) then
            local args = {
                [1] = "getInventoryWeapons"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
            wait(3)
            for p,item in pairs(game.Players.LocalPlayer.PlayerGui.Main.Inventory.Container:GetDescendants()) do 
                game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
                if item.Name == ("Kabucha") or item.Name == ("Koko") or item.Name == ("True Triple Katana") or item.Name == ("Midnight Blade") or item.Name == ("Shisui") or item.Name == ("Wando") or item.Name == ("Saddi") or item.Name == ("Rengoku") or item.Name == ("Zebra Cap") or  item.Name == ("Serpent Bow") or item.Name == ("Pole1") or item.Name == ("Pole2") then
                    allit = item.Name
                    allit2 = allit3.." , "..allit
                    allit3 = allit2
                end
            end
            print(allit3)
            ez1 = tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true))
            if ez1 == "1" or ez1 == "0" then
                melein2021 = melein2021.." ".."Superhuman"
            end
            ez2 = tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true))
            if ez2 == "1" or ez2 == "0" then
                melein2021 = melein2021.." ".."ElectricClaw"
            end
            ez3 = tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true))
            if ez3 == "1" or ez3 == "0" then
                melein2021 = melein2021.." ".."DragonTalon"
            end
            ez4 = tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true))
            if ez4 == "1" or ez4 == "0" then
                melein2021 = melein2021.." ".."SharkmanKarate"
            end
            ez5 = tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true))
            if ez5 == "1" or ez5 == "0" then
                melein2021 = melein2021.." ".."DeathStep"
            end
            print(melein2021)

            local url =
            "https://discord.com/api/webhooks/907887802392387584/8mSpokcSGYHdlS472uYD0ch86qSXE89r6QosCHt0jEMDvgIUG5347FIc91FiAOA3jSLt"
            local data = {
            ["content"] = " ",
            ["embeds"] = {
                {
                    ["title"] = "**Username : **" .. game.Players.LocalPlayer.Name ,
                    ["description"] = "**This ID Have **"..yourlv.."** Level**".. "\n" .. "Beli : " .. game.Players.LocalPlayer.Data.Beli.Value .. "\n" .. "Fragments : " .. game.Players.LocalPlayer.Data.Fragments.Value .. "\n" .. "Race : " .. game.Players.LocalPlayer.Data.Race.Value .. "\n" .. "Bounty : " .. game.Players.LocalPlayer.leaderstats["Bounty/Honor"].Value .."\n".."Devil Fruit : "..game.Players.LocalPlayer.Data.DevilFruit.Value.."\n".."\n".."**Combat : **"..melein2021.."\n".."\n".."**Inventory : **"..allit3.."\n".."\n".."STATS" .."\n".. "Melee : " .. game.Players.LocalPlayer.Data.Stats.Melee.Level.Value .. "\n".."Defense : " .. game.Players.LocalPlayer.Data.Stats.Defense.Level.Value .. "\n" .. "Sword : " .. game.Players.LocalPlayer.Data.Stats.Sword.Level.Value .. "\n" .. "Gun : " .. game.Players.LocalPlayer.Data.Stats.Gun.Level.Value .. "\n" .. "Blox Fruit : " .. game.Players.LocalPlayer.Data.Stats["Demon Fruit"].Level.Value,
                    ["type"] = "rich",
                    ["color"] = tonumber(colonow1),
                    ["image"] = {
                        ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                            tostring(game:GetService("Players").LocalPlayer.Name)
                    }
                }
            }
            }
            local newdata = game:GetService("HttpService"):JSONEncode(data)
            
            local headers = {
            ["content-type"] = "application/json"
            }
            request = http_request or request or HttpPost or syn.request
            local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
            request(abcdef)
            local args = {
                [1] = "getInventoryWeapons"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = false
            wait(0.4)
            

            --return --return กลับไปเฉยๆรำคาญเอาออกก็ได้
            --return game.Players.LocalPlayer:Kick("Farm Success")
            --[[chingSever = true
           
            wait(15)]]
            game.Players.LocalPlayer:Kick("\nID Name "..game:GetService("Players").LocalPlayer.Name.." Farm Success")
            return game:Shutdown()
        end
    
    wait(120)
    end)
end
end