-- Reader.lua
local Reader = {}
Reader.__index = Reader

function Reader.new(data)
    local self = setmetatable({}, Reader)
    self.data = data
    self.pos = 1
    self.len = #data
    return self
end

function Reader:readByte()
    local b = string.byte(self.data, self.pos)
    self.pos = self.pos + 1
    return b
end

function Reader:readInt32()
    local b1, b2, b3, b4 = string.byte(self.data, self.pos, self.pos + 3)
    self.pos = self.pos + 4
    return b1 + (b2 * 256) + (b3 * 65536) + (b4 * 16777216)
end

function Reader:readString(len)
    local str = string.sub(self.data, self.pos, self.pos + len - 1)
    self.pos = self.pos + len
    return str
end

function Reader:readLEB128()
    local result = 0
    local shift = 0
    local byte
    repeat
        byte = self:readByte()
        result = bit32.bor(result, bit32.lshift(bit32.band(byte, 0x7F), shift))
        shift = shift + 7
    until bit32.band(byte, 0x80) == 0
    return result
end

return Reader
