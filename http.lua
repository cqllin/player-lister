local r = Router.new()

r:Get('/', function(req, res)
    local players = GetPlayers()
    local data = { players = {} }
    
    if #players == 0 then
        data.players = "No players online!"
    else
        for _, player in ipairs(players) do
            local allIdentifiers = GetAllIdentifiers(player)
            local name = GetPlayerName(player)
            local ping = GetPlayerPing(player)

            table.insert(data.players, {
                id = player,
                identifiers = allIdentifiers,
                name = name,
                ping = ping
            })
        end
    end

    res:Send(json.encode(data))
end)

r:Get('/:player', function(req, res)
    local sentPlayerId = req:Param("player")
    local players = GetPlayers()
    local data = {}
    local found = false

    if not sentPlayerId or tonumber(sentPlayerId) == nil then
        local errorString = "^1Error:^0 Invalid player source.^7"
        data.error = errorString

        res:Send(json.encode(data))
    else
        if #players == 0 then
            data.players = "No players online!"
        else
            sentPlayerId = tostring(sentPlayerId)
            for _, player in ipairs(players) do
                if sentPlayerId == player then
                    found = true
                    local allIdentifiers = GetAllIdentifiers(player)
                    local name = GetPlayerName(player)
                    local ping = GetPlayerPing(player)

                    data.player = {
                        id = player,
                        identifiers = allIdentifiers,
                        name = name,
                        ping = ping
                    }

                    break
                end
            end

            if not found then
                data.error = "Player ID not found!"
            end
        end

        res:Send(json.encode(data))
    end
end)

Server.use('/players', r)
Server.listen()