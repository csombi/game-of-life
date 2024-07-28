local Menu = require("game-of-life.ui.menu")

local M = {}
M.__index = M

function M.new()
    local menu = Menu.new()
    local instance = setmetatable({
        menu = menu
    }, M)

    return instance
end

function M:open()
    self.menu:open()
end

function M:close()
    self.menu:handle_exit()
end

return M
