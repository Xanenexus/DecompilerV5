-- init.lua
-- Đây là file bạn sẽ chạy (Execute)

-- Cấu hình repo của bạn
local GITHUB_USER = "Xanenexus" -- Đổi tên thành user của bạn
local REPO_NAME = "DecompilerV5" -- Đổi tên thành repo của bạn
local BRANCH = "main"

local function loadModule(path)
    local url = string.format("https://raw.githubusercontent.com/%s/%s/%s/%s", GITHUB_USER, REPO_NAME, BRANCH, path)
    local content = game:HttpGet(url)
    return loadstring(content)()
end

-- Tự động load các module từ GitHub
local Reader = loadModule("Reader.lua")
local Luau = loadModule("Luau.lua")
local Strings = loadModule("Strings.lua")
local Impl = loadModule("Implementations.lua")

local Decompiler = {}
Decompiler.__index = Decompiler

function Decompiler.new()
    return setmetatable({}, Decompiler)
end

function Decompiler:Decompile(scriptInstance)
    -- Giả lập lấy bytecode (cần executor hỗ trợ getscriptbytecode)
    local bytecode = getscriptbytecode(scriptInstance)
    local reader = Reader.new(bytecode)
    
    -- Ở đây sẽ gọi logic parse từ Impl
    -- Demo trả về:
    return "-- Core V5 Loaded successfully.\n-- Modular structure active."
end

return Decompiler
