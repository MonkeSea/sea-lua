--[[local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            -- delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                     writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end
function Teleport() 
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end
Teleport()]]
writefile('servers.sss', game:service'HttpService':JSONEncode({}))
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
local HttpService, TPService = game:GetService"HttpService", game:GetService"TeleportService";
local OtherServers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
function joinNew()
    if not isfile('servers.sss') then 
        writefile('servers.sss',HttpService:JSONEncode({}))
    end
    local dontJoin = readfile('servers.sss') 
    dontJoin = HttpService:JSONDecode(dontJoin)

    for Index, Server in next, OtherServers["data"] do
        if Server ~= game.JobId then
            local j = true
            for a,c in pairs(dontJoin) do 
               if c == Server.id then 
                   j = false 
               end
            end
            if j then
                table.insert(dontJoin,Server["id"])
                writefile("servers.sss",HttpService:JSONEncode(dontJoin))
                wait()
                return Server['id']
                
                
            end
        end
    end
end
while wait(5) do
warn("finding the server")
local server = joinNew()
if not server then 
    writefile("servers.sss",HttpService:JSONEncode({}))
    local server = joinNew()
    TPService:TeleportToPlaceInstance(game.PlaceId, server)
else
TPService:TeleportToPlaceInstance(game.PlaceId, server)
end
end
