local Gameboard = require("game-of-life.logic.gameboard")
local ConfigurationType = require("game-of-life.logic.configuration_type")
local Configuration = require("game-of-life.logic.configuration")

local M = {}

---Converts the state into buffer lines
---@param state StateMatrix
---@return table lines
local function convert_to_string(state)
    local lines = {}

    for y = 1, state.height do
        local line = ""
        for x = 1, state.width do
            if 0 == state.state[y][x] then
                line = line .. " "
            else
                line = line .. "X"
            end
        end
        lines[y] = line
    end

    return lines
end

---Starts the game
---@param gameboard Gameboard
---@param buffer any
---@param window any
---@param round_limit number
local function start(gameboard, buffer, window, round_limit)
    local lines = convert_to_string(gameboard.state.state)
    local timer, timer_err = vim.uv.new_timer()
    if not timer then
        error("game-of-life could not create a new timer! " .. timer_err)
    end

    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)

    local generation = 0
    timer:start(2000, 1000, vim.schedule_wrap(function()
        if generation >= round_limit then
            timer:close()
        end

        gameboard.state:generate_next_state()
        lines = convert_to_string(gameboard.state.state)
        vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)
        generation = generation + 1
    end))
end

function M.setup()
    local type = ConfigurationType.BLINKER
    local config = Configuration.new(20, 20, type)
    local gameboard = Gameboard.new(config)
    local round_limit = 50

    local buffer = vim.api.nvim_create_buf(false, false)
    if 0 == buffer then
        error("game-of-life could not create a new buffer!")
    end

    local window = vim.api.nvim_open_win(
        buffer,
        false,
        {
            relative = "win",
            row = gameboard.configuration.height,
            col = gameboard.configuration.width,
            width = gameboard.configuration.width,
            height = gameboard.configuration.height,
            border = "double"
        })
    if 0 == window then
        error("game-of-life could not create a new window!")
    end

    start(gameboard, buffer, window, round_limit)

    vim.api.nvim_set_current_win(window)
end

return M
