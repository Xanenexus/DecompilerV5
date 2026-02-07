-- Strings.lua
local Strings = {}

function Strings.formatString(str)
    return string.format("%q", str):gsub("\\\n", "\\n")
end

function Strings.hexDump(str)
    return (str:gsub(".", function(c) 
        return string.format("%02X ", string.byte(c)) 
    end))
end

function Strings.sanitize(name)
    if not name:match("^[a-zA-Z_][a-zA-Z0-9_]*$") then
        return "var_" .. math.random(1000,9999)
    end
    return name
end

return Strings
