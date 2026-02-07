-- Luau.lua
return {
    OPCODES = {
        [0x00] = "NOP", [0x01] = "MOVE", [0x02] = "LOADK", [0x03] = "LOADKX",
        [0x04] = "LOADNIL", [0x05] = "LOADB", [0x06] = "LOADI", [0x07] = "FNEW",
        [0x09] = "GETUPVAL", [0x0A] = "SETUPVAL", [0x0B] = "GGET", [0x0C] = "GSET",
        [0x0D] = "TGET", [0x0E] = "TGETI", [0x0F] = "TGETS", [0x10] = "TSET",
        [0x11] = "TSETI", [0x12] = "TSETS", [0x13] = "NEWTABLE", [0x14] = "DUPTABLE",
        [0x1D] = "ADD", [0x1E] = "SUB", [0x1F] = "MUL", [0x20] = "DIV",
        [0x21] = "MOD", [0x22] = "POW", [0x2E] = "ADDK", [0x2F] = "SUBK",
        [0x33] = "EQ", [0x35] = "LT", [0x36] = "LE", [0x41] = "JMP",
        [0x45] = "CALL", [0x4A] = "RETURN", [0x4E] = "FORLOOP", [0x52] = "FNEXT",
        -- ... Thêm các opcode khác nếu cần, đây là bản core V5
    }
}
