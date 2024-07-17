local ConfigurationType = require("configuration_type")
local StateMatrix = require("state_matrix")

---@class Configuration
---@field width number
---@field height number
---@field type string
local Configuration = {}
Configuration.__index = Configuration

---@param width number
---@param height number
---@param type string
---@return Configuration
Configuration.new = function(width, height, type)
    local instance = setmetatable({
        width = width,
        height = height,
        type = type
    }, Configuration)

    return instance
end

---Gets the initial state based on the configuration
---@return StateMatrix
function Configuration:get_initial_state()
    -- Setting every cell as inactive
    local initial_state = {}
    for i = 1, self.height do
        local row = {}
        initial_state[i] = row
        for j = 1, self.width do
            row[j] = 0
        end
    end

    -- Setting active cells
    local center_x = math.floor(self.width / 2)
    local center_y = math.floor(self.height / 2)
    if self.type == ConfigurationType.BLOCK then
        initial_state[center_x][center_y] = 1
        initial_state[center_x + 1][center_y] = 1
        initial_state[center_x][center_y + 1] = 1
        initial_state[center_x + 1][center_y + 1] = 1
    elseif self.type == ConfigurationType.BEEHIVE then
        initial_state[center_x + 1][center_y] = 1
        initial_state[center_x + 2][center_y] = 1
        initial_state[center_x][center_y + 1] = 1
        initial_state[center_x + 3][center_y + 1] = 1
        initial_state[center_x + 1][center_y + 2] = 1
        initial_state[center_x + 2][center_y + 2] = 1
    elseif self.type == ConfigurationType.LOAF then
        initial_state[center_x + 1][center_y] = 1
        initial_state[center_x + 2][center_y] = 1
        initial_state[center_x][center_y + 1] = 1
        initial_state[center_x + 3][center_y + 1] = 1
        initial_state[center_x + 1][center_y + 2] = 1
        initial_state[center_x + 3][center_y + 2] = 1
        initial_state[center_x + 2][center_y + 3] = 1
    elseif self.type == ConfigurationType.BOAT then
        initial_state[center_x][center_y] = 1
        initial_state[center_x + 1][center_y] = 1
        initial_state[center_x][center_y + 1] = 1
        initial_state[center_x + 1][center_y + 2] = 1
        initial_state[center_x + 2][center_y + 1] = 1
    elseif self.type == ConfigurationType.TUB then
        initial_state[center_x + 1][center_y] = 1
        initial_state[center_x][center_y + 1] = 1
        initial_state[center_x + 1][center_y + 2] = 1
        initial_state[center_x + 2][center_y + 1] = 1
    elseif self.type == ConfigurationType.BLINKER then
        -- TODO
    elseif self.type == ConfigurationType.TOAD then
        -- TODO
    elseif self.type == ConfigurationType.BEACON then
        -- TODO
    elseif self.type == ConfigurationType.PULSAR then
        -- TODO
    elseif self.type == ConfigurationType.PENTADECATHLON then
        -- TODO
    elseif self.type == ConfigurationType.GLIDER then
        -- TODO
    elseif self.type == ConfigurationType.LIGHT_WEIGHT_SPACESHIP then
        -- TODO
    elseif self.type == ConfigurationType.MIDDLE_WEIGHT_SPACESHIP then
        -- TODO
    elseif self.type == ConfigurationType.HEAVY_WEIGHT_SPACESHIP then
        -- TODO
    elseif self.type == ConfigurationType.RANDOM then
        -- TODO
    end

    return StateMatrix.new(initial_state)
end

return Configuration
