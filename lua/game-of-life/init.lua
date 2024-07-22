local Gameboard = require("game-of-life.logic.gameboard")
local ConfigurationType = require("game-of-life.logic.configuration_type")
local Configuration = require("game-of-life.logic.confiugration")
local StateMatrix = require("game-of-life.logic.state_matrix")
local State = require("game-of-life.logic.state")

local M = {}

function M.setup()
    print(ConfigurationType.BLOCK) -- TEST
end

return M
