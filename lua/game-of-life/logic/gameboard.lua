local State = require("game-of-life.logic.state")

---@class Gameboard
---@field configuration Configuration
---@field state number[][]
local Gameboard = {}
Gameboard.__index = Gameboard

---Converts the state into buffer lines
---@return table lines
function Gameboard:get_state_as_lines()
    local lines = {}

    -- TODO: Remove redundancy
    for y = 1, self.configuration.height do
        local line = ""
        for x = 1, self.configuration.width do
            if 0 == self.state[y][x] then
                line = line .. " "
            else
                line = line .. "x"
            end
        end
        lines[y] = line
    end

    return lines
end

function Gameboard:generate_next_state()
    self.state = State.generate_next_state(self.state)
end

---@param configuration Configuration
---@return Gameboard
Gameboard.new = function(configuration)
    local instance = setmetatable({
        configuration = configuration,
        state = State.new_by_config(configuration)
    }, Gameboard)

    return instance
end

return Gameboard
