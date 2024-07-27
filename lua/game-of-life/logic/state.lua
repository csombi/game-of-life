---@class State
local State = {}
State.__index = State
State.__eq = function(a, b)
    if #a ~= #b or #a[1] ~= #b[1] then
        return false
    end

    local equals = true
    for i = 1, a.width do
        for j = 1, a.height do
            equals = equals and a[i][j] == b[i][j]
        end
    end

    return equals
end

---Gets the collection of neighbours' indices
---@param state number[][]
---@param y number
---@param x number
local function get_neighbour_indicies(state, x, y)
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

    if 0 < y - 1 and x + 1 <= #state[1] then
        inidices[index] = { y - 1, x + 1 }
        index = index + 1
    end

    if 0 < x - 1 then
        inidices[index] = { y, x - 1 }
        index = index + 1
    end

    if x + 1 <= #state[1] then
        inidices[index] = { y, x + 1 }
        index = index + 1
    end

    if y + 1 <= #state and 0 < x - 1 then
        inidices[index] = { y + 1, x - 1 }
        index = index + 1
    end

    if y + 1 <= #state then
        inidices[index] = { y + 1, x }
        index = index + 1
    end

    if y + 1 <= #state and x + 1 <= #state[1] then
        inidices[index] = { y + 1, x + 1 }
        index = index + 1
    end

    return inidices
end

---Gets the number of living neighbours
---@param state number[][]
---@param neighbour_inidices number[][]
local function get_living_neighbours_count(state, neighbour_inidices)
    local count = 0
    for _, index in pairs(neighbour_inidices) do
        if state[index[1]][index[2]] == 1 then
            count = count + 1
        end
    end

    return count
end

---Gets a new state with only inactive cells
---@param state_to_copy number[][]
---@return number[][]
function State.new_empty(state_to_copy)
    local new_state = {}
    for i = 1, #state_to_copy do
        local row = {}
        new_state[i] = row
        for j = 1, #state_to_copy[1] do
            row[j] = 0
        end
    end

    return new_state
end

---Gets the next state
---@param state number[][]
---@return number[][]
State.generate_next_state = function(state)
    local next_state = State.new_empty(state)
    for y = 1, #state do
        for x = 1, #state[1] do
            local neighbour_inidices = get_neighbour_indicies(state, x, y)
            local living_neighbours_count = get_living_neighbours_count(state, neighbour_inidices)
            if state[y][x] == 1 then
                -- Any live cell with fewer than two live neighbours dies, as if by underpopulation.
                -- Any live cell with two or three live neighbours lives on to the next generation.
                -- Any live cell with more than three live neighbours dies, as if by overpopulation.
                if living_neighbours_count < 2 or 3 < living_neighbours_count then
                    next_state[y][x] = 0
                else
                    next_state[y][x] = 1
                end
            else
                -- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
                if living_neighbours_count == 3 then
                    next_state[y][x] = 1
                end
            end
        end
    end

    return next_state
end

---@param configuration Configuration
---@return number[][]
State.new_by_config = function(configuration)
    return configuration:get_initial_state()
end

return State
