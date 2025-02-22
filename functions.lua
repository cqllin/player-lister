function GetIdentifier(source, identifier)
    if not source or tonumber(source) == nil then
        print("^1Error:^0 Invalid player source^7")
        return nil
    end

    if not identifier or type(identifier) ~= "string" then
        print("^1Error:^0 Identifier type must be a string (e.g., 'discord', 'license')^7")
        return nil
    end

    for _, identifier in ipairs(GetPlayerIdentifiers(source)) do
        if identifier:match(type..":") then
            return identifier:gsub(type..":", "")
        end
    end
    return false
end

function GetAllIdentifiers(source)
    if not source or tonumber(source) == nil then
        print("^1Error:^0 Invalid player source.^7")
        return nil
    end

    local identifiers = {}

    for _, identifier in ipairs(GetPlayerIdentifiers(source)) do
        local idType, idValue = identifier:match("([^:]+):(.+)")
        if idType and idValue then
            identifiers[idType] = idValue
        end
    end

    return identifiers
end