local Gameboard = require("game-of-life.logic.gameboard")
local ConfigurationType = require("game-of-life.logic.configuration_type")
local Configuration = require("game-of-life.logic.configuration")
local Menu = require("game-of-life.ui.menu")

local M = {}

function M.setup()
    local configuration = Configuration.new(150, 30, ConfigurationType.GLIDER, 200)
    local gameboard = Gameboard.new(configuration)
    local menu = Menu.new(gameboard)
    menu:open()
end

return M
