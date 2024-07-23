local State = require("game-of-life.logic.state")

---@class Gameboard
---@field configuration Configuration
---@field state State
local Gameboard = {}
Gameboard.__index = Gameboard

Gameboard.__tostring = function(gameboard)
    print(" {")
    print(tostring(gameboard.configuration))
    print(tostring(gameboard.state))
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

return Gameboard
