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
