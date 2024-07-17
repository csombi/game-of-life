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

---comment
---@param state table
---@return StateMatrix
StateMatrix.new = function(state)
    local instance = setmetatable({
        state = state,
        width = #state,
        height = #state[1],
    }, StateMatrix)

    return instance
end

return StateMatrix
