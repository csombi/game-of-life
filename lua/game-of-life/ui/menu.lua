local NuiMenu = require("nui.menu")
local NuiEvent = require("nui.utils.autocmd").event

---Represents Game of Life menu
---@class Menu
---@field gameboard Gameboard
local Menu = {}
Menu.__index = Menu

function Menu:handle_configuration()
end

function Menu:handle_start()
    local buffer = vim.api.nvim_create_buf(false, false)
    if 0 == buffer then
        error("game-of-life could not create a new buffer!")
    end

    local win_width = vim.o.columns
    local win_height = vim.o.lines
    local shift_y = math.floor((win_height - self.gameboard.configuration.height) / 2)
    local shift_x = math.floor((win_width - self.gameboard.configuration.width) / 2)
    local window = vim.api.nvim_open_win(
        buffer,
        false,
        {
            relative = "editor",
            row = shift_y,
            col = shift_x,
            width = self.gameboard.configuration.width,
            height = self.gameboard.configuration.height,
            border = "single",
            title = "Game of Life",
            title_pos = "center"
        })
    if 0 == window then
        error("game-of-life could not create a new window!")
    end

    local timer, timer_err = vim.uv.new_timer()
    if not timer then
        error("game-of-life could not create a new timer! " .. timer_err)
    end

    local lines = self.gameboard:get_state_as_lines()
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)

    local generation = 0
    timer:start(2000, 500, vim.schedule_wrap(function()
        if generation >= self.gameboard.configuration.max_generation then
            timer:close()
        end

        self.gameboard:generate_next_state()
        lines = self.gameboard:get_state_as_lines()
        vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)
        generation = generation + 1
    end))
end

function Menu:handle_exit()
end

function Menu:open()
    local popup_options = {
        position = "50%",
        enter = true,
        focusable = true,
        relative = "editor",
        border = {
            padding = {
                top = 2,
                bottom = 2,
                left = 3,
                right = 3,
            },
            style = "single",
            text = {
                top = "Menu",
                top_align = "center",
            },
        },
        buf_options = {
            modifiable = true,
            readonly = false,
        },
    }

    local menu_options = {
        lines = {
            NuiMenu.item("Start"),
            NuiMenu.item("Configure"),
            NuiMenu.item("Exit"),
        },
        on_submit = function(item)
            if "Start" == item.text then
                self:handle_start()
            elseif "Configure" == item.text then
                self:handle_configuration()
            elseif "Exit" == item.text then
                self:handle_exit()
            end
        end
    }

    local nui_menu = NuiMenu(popup_options, menu_options)

    nui_menu:on(NuiEvent.BufLeave, function()
        nui_menu:unmount()
    end)

    nui_menu:mount()
end

---Gets a new Menu instance
---@param gameboard Gameboard
---@return Menu Menu
Menu.new = function(gameboard)
    local instance = setmetatable({
        gameboard = gameboard
    }, Menu)

    return instance
end

return Menu
