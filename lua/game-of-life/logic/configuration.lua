local ConfigurationType = require("game-of-life.logic.configuration_type")
local StateMatrix = require("game-of-life.logic.state_matrix")

---@class Configuration
---@field width number
---@field height number
---@field type string
local Configuration = {}
Configuration.__index = Configuration

local function ctor_width_error(configuration_type, value)
    error(configuration_type .. " configuraiton requires a width of at least " .. value .. " cells.")
end

local function ctor_height_error(configuration_type, value)
    error(configuration_type .. " configuraiton requires a height of at least " .. value .. " cells.")
end

---@param width number
---@param height number
---@param type string
---@return Configuration
Configuration.new = function(width, height, type)
    local min_width = 0
    local min_height = 0

    if type == ConfigurationType.BLOCK then
        min_width = 4
        min_height = 4
        if width < min_width then
            ctor_width_error(ConfigurationType.BLOCK, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.BLOCK, min_height)
        end
    elseif type == ConfigurationType.BEEHIVE then
        min_width = 6
        min_height = 5
        if width < min_width then
            ctor_width_error(ConfigurationType.BEEHIVE, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.BEEHIVE, min_height)
        end
    elseif type == ConfigurationType.LOAF then
        min_width = 6
        min_height = 6
        if width < min_width then
            ctor_width_error(ConfigurationType.LOAF, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.LOAF, min_height)
        end
    elseif type == ConfigurationType.BOAT then
        min_width = 5
        min_height = 5
        if width < min_width then
            ctor_width_error(ConfigurationType.BOAT, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.BOAT, min_height)
        end
    elseif type == ConfigurationType.TUB then
        min_width = 5
        min_height = 5
        if width < min_width then
            ctor_width_error(ConfigurationType.TUB, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.TUB, min_height)
        end
    elseif type == ConfigurationType.BLINKER then
        min_width = 5
        min_height = 5
        if width < min_width then
            ctor_width_error(ConfigurationType.BLINKER, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.BLINKER, min_height)
        end
    elseif type == ConfigurationType.TOAD then
        min_width = 6
        min_height = 6
        if width < min_width then
            ctor_width_error(ConfigurationType.TOAD, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.TOAD, min_height)
        end
    elseif type == ConfigurationType.BEACON then
        min_width = 6
        min_height = 6
        if width < min_width then
            ctor_width_error(ConfigurationType.BEACON, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.BEACON, min_height)
        end
    elseif type == ConfigurationType.PULSAR then
        min_width = 17
        min_height = 17
        if width < min_width then
            ctor_width_error(ConfigurationType.PULSAR, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.PULSAR, min_height)
        end
    elseif type == ConfigurationType.PENTADECATHLON then
        min_width = 11
        min_height = 18
        if width < min_width then
            ctor_width_error(ConfigurationType.PENTADECATHLON, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.PENTADECATHLON, min_height)
        end
    elseif type == ConfigurationType.GLIDER then
        min_width = 7
        min_height = 7
        if width < min_width then
            ctor_width_error(ConfigurationType.GLIDER, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.GLIDER, min_height)
        end
    elseif type == ConfigurationType.LIGHT_WEIGHT_SPACESHIP then
        min_width = 20
        min_height = 20
        if width < min_width then
            ctor_width_error(ConfigurationType.LIGHT_WEIGHT_SPACESHIP, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.LIGHT_WEIGHT_SPACESHIP, min_height)
        end
    elseif type == ConfigurationType.MIDDLE_WEIGHT_SPACESHIP then
        min_width = 20
        min_height = 20
        if width < min_width then
            ctor_width_error(ConfigurationType.MIDDLE_WEIGHT_SPACESHIP, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.MIDDLE_WEIGHT_SPACESHIP, min_height)
        end
    elseif type == ConfigurationType.HEAVY_WEIGHT_SPACESHIP then
        min_width = 20
        min_height = 20
        if width < min_width then
            ctor_width_error(ConfigurationType.HEAVY_WEIGHT_SPACESHIP, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.HEAVY_WEIGHT_SPACESHIP, min_height)
        end
    elseif type == ConfigurationType.RANDOM then
        min_width = 1
        min_height = 1
        if width < min_width then
            ctor_width_error(ConfigurationType.RANDOM, min_width)
        end

        if height < min_height then
            ctor_height_error(ConfigurationType.RANDOM, min_height)
        end
    end

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
    local center_y = math.floor(self.height / 2)
    local center_x = math.floor(self.width / 2)
    if self.type == ConfigurationType.BLOCK then
        initial_state[center_y][center_x] = 1
        initial_state[center_y][center_x + 1] = 1
        initial_state[center_y + 1][center_x] = 1
        initial_state[center_y + 1][center_x + 1] = 1
    elseif self.type == ConfigurationType.BEEHIVE then
        initial_state[center_y][center_x + 1] = 1
        initial_state[center_y][center_x + 2] = 1
        initial_state[center_y + 1][center_x] = 1
        initial_state[center_y + 1][center_x + 3] = 1
        initial_state[center_y + 2][center_x + 1] = 1
        initial_state[center_y + 2][center_x + 2] = 1
    elseif self.type == ConfigurationType.LOAF then
        initial_state[center_y][center_x + 1] = 1
        initial_state[center_y][center_x + 2] = 1
        initial_state[center_y + 1][center_x] = 1
        initial_state[center_y + 1][center_x + 3] = 1
        initial_state[center_y + 2][center_x + 1] = 1
        initial_state[center_y + 2][center_x + 3] = 1
        initial_state[center_y + 3][center_x + 2] = 1
    elseif self.type == ConfigurationType.BOAT then
        initial_state[center_y][center_x] = 1
        initial_state[center_y][center_x + 1] = 1
        initial_state[center_y + 1][center_x] = 1
        initial_state[center_y + 1][center_x + 2] = 1
        initial_state[center_y + 2][center_x + 1] = 1
    elseif self.type == ConfigurationType.TUB then
        initial_state[center_y][center_x + 1] = 1
        initial_state[center_y + 1][center_x] = 1
        initial_state[center_y + 2][center_x + 1] = 1
        initial_state[center_y + 1][center_x + 2] = 1
    elseif self.type == ConfigurationType.BLINKER then
        initial_state[center_y - 1][center_x] = 1
        initial_state[center_y][center_x] = 1
        initial_state[center_y + 1][center_x] = 1
    elseif self.type == ConfigurationType.TOAD then
        initial_state[center_y][center_x + 1] = 1
        initial_state[center_y][center_x + 2] = 1
        initial_state[center_y][center_x + 3] = 1
        initial_state[center_y + 1][center_x] = 1
        initial_state[center_y + 1][center_x + 1] = 1
        initial_state[center_y + 1][center_x + 2] = 1
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
