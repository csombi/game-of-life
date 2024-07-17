
---@class Gameboard
---@field width number
---@field height number
local Gameboard = {}

---@param width number
---@param height number
---@return Gameboard
Gameboard.new = function (width, height)
    local instance = setmetatable({
        width = width,
        height = height,
    }, {
        __tostring = Gameboard.print
    })

    return instance
end

function Gameboard:print()
end