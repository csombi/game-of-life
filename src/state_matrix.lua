---@class StateMatrix
---@field state table
---@field width number
---@field height number
local StateMatrix = {}
StateMatrix.__index = StateMatrix
StateMatrix.__eq = function(a, b)
    if a.width ~= b.width or a.height ~= b.height then
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

---Initializes a new state matrix
---@param state table
---@return StateMatrix
StateMatrix.new = function(state)
    local instance = setmetatable({
        state = state,
        width = #state[1],
        height = #state,
    }, StateMatrix)

    return instance
end

---Initializes a new state matrix with only inactive cells
---@param width number
---@param height number
---@return StateMatrix
StateMatrix.new_empty = function(width, height)
    local state = {}
    for i = 1, height do
        local row = {}
        state[i] = row
        for j = 1, width do
            row[j] = 0
        end
    end

    local instance = setmetatable({
        width = width,
        height = height,
        state = state
    }, StateMatrix)

    return instance
end


function StateMatrix:print()
    print("[")
    for i = 1, self.height do
        local output = "{ "
        for j = 1, self.width do
            output = output .. self.state[i][j] .. ", "
        end
        output = output .. "}"
        print(output)
    end
    print("]")
end

return StateMatrix
