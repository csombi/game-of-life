local State = require("state")

---@class Gameboard
---@field configuration Configuration
---@field state State
local Gameboard = {}
Gameboard.__index = Gameboard

Gameboard.__tostring = function(gameboard)
    print(" {")
    print(gameboard.configuration)
    print(gameboard.state)
    print(" }")
end

---@param configuration Configuration
---@return Gameboard
Gameboard.new = function(configuration)
    local instance = setmetatable({
        configuration = configuration,
        state = State.new(configuration)
    }, Gameboard)

    return instance
end
