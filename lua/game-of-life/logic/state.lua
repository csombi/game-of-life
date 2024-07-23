local StateMatrix = require("state_matrix")

---@class State
---@field configuration Configuration
---@field state StateMatrix
local State = {}
State.__index = State

---Gets the collection of neighbours' indices
---@param state_matrix StateMatrix
---@param x number
---@param y number
local function get_neighbour_indicies(state_matrix, x, y)
    local inidices = {}
    local index = 1

    if 0 < y - 1 and 0 < x - 1 then
        inidices[index] = { y - 1, x - 1 }
        index = index + 1
    end

    if 0 < y - 1 then
        inidices[index] = { y - 1, x }
        index = index + 1
    end

    if 0 < y - 1 and x + 1 <= state_matrix.width then
        inidices[index] = { y - 1, x + 1 }
        index = index + 1
    end

    if 0 < x - 1 then
        inidices[index] = { y, x - 1 }
        index = index + 1
    end

    if x + 1 <= state_matrix.width then
        inidices[index] = { y, x + 1 }
        index = index + 1
    end

    if y + 1 <= state_matrix.height and 0 < x - 1 then
        inidices[index] = { y + 1, x - 1 }
        index = index + 1
    end

    if y + 1 <= state_matrix.height then
        inidices[index] = { y + 1, x }
        index = index + 1
    end

    if y + 1 <= state_matrix.height and x + 1 <= state_matrix.width then
        inidices[index] = { y + 1, x + 1 }
        index = index + 1
    end

    return inidices
end

---Gets the number of living neighbours
---@param state_matrix StateMatrix
---@param neighbour_inidices number[][]
local function get_living_neighbours_count(state_matrix, neighbour_inidices)
    local count = 0
    for _, index in pairs(neighbour_inidices) do
        if state_matrix.state[index[1]][index[2]] == 1 then
            count = count + 1
        end
    end

    return count
end

---@param configuration Configuration
---@return State
State.new = function(configuration)
    local instance = setmetatable({
        configuration = configuration,
        state = configuration:get_initial_state()
    }, State)
    return instance
end

function State:generate_next_state()
    local next_state = StateMatrix.new_empty(self.configuration.width, self.configuration.height)
    for y = 1, self.state.height do
        for x = 1, self.state.width do
            local neighbour_inidices = get_neighbour_indicies(self.state, x, y)
            local living_neighbours_count = get_living_neighbours_count(self.state, neighbour_inidices)
            if self.state.state[y][x] == 1 then
                -- Any live cell with fewer than two live neighbours dies, as if by underpopulation.
                -- Any live cell with two or three live neighbours lives on to the next generation.
                -- Any live cell with more than three live neighbours dies, as if by overpopulation.
                if living_neighbours_count < 2 or 3 < living_neighbours_count then
                    next_state.state[y][x] = 0
                else
                    next_state.state[y][x] = 1
                end
            else
                -- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
                if living_neighbours_count == 3 then
                    next_state.state[y][x] = 1
                end
            end
        end
    end

    self.state = next_state
end

function State:print()
    self.state:print()
end

return State
