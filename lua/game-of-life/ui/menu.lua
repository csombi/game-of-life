local NuiMenu = require("nui.menu")
local NuiEvent = require("nui.utils.autocmd").event
local ConfigurationType = require("game-of-life.logic.configuration_type")
local Configuration = require("game-of-life.logic.configuration")
local Gameboard = require("game-of-life.logic.gameboard")

---Represents Game of Life menu
---@class Menu
---@field gameboard Gameboard: current gameboard instance
---@field configuration Configuration: a configuration to initiate a new gameboard with
---@field menu NuiMenu: menu instance
---@field bufffer_id number | nil: buffer_id of the gameboard
---@field window_id number | nil: window_id of the gameboard
---@field timer table: timer instance
local Menu = {}
Menu.__index = Menu

local GAMEBOARD_WIDTH = 150
local GAMEBOARD_HEIGHT = 30
local MAX_GENERATION = 100

---Creates a buffer
function Menu:create_buffer()
    if self.bufffer_id then
        pcall(vim.api.nvim_buf_delete, self.bufffer_id, { force = true })
    end

    local buffer = vim.api.nvim_create_buf(false, false)
    if 0 == buffer then
        error("game-of-life could not create a new buffer!")
    end

    self.bufffer_id = buffer
end

---Creates a window, if one does not already exist
---@param configuration_type string: name of the configuration
function Menu:create_window(configuration_type)
    if not self.bufffer_id then
        self:create_buffer()
    end

    if self.window_id then
        pcall(vim.api.nvim_win_close, self.window_id, true)
    end

    local win_width = vim.o.columns
    local win_height = vim.o.lines
    local shift_y = math.floor((win_height - self.gameboard.configuration.height) / 2)
    local shift_x = math.floor((win_width - self.gameboard.configuration.width) / 2)
    local window = vim.api.nvim_open_win(
        self.bufffer_id,
        false,
        {
            relative = "editor",
            row = shift_y,
            col = shift_x,
            width = self.gameboard.configuration.width,
            height = self.gameboard.configuration.height,
            border = "single",
            title = "Game of Life - " .. configuration_type,
            title_pos = "center"
        })
    if 0 == window then
        error("game-of-life could not create a new window!")
    end

    self.window_id = window
end

---Creates a timer
function Menu:create_timer()
    if self.timer then
        pcall(self.timer.close, self.timer)
    end

    local timer, timer_err = vim.uv.new_timer()
    if not timer then
        error("game-of-life could not create a new timer! " .. timer_err)
    end

    self.timer = timer
end

---Creates a gameboard
function Menu:create_gameboard()
    if not self.configuration then
        self.configuration = Configuration.new(
            GAMEBOARD_WIDTH,
            GAMEBOARD_HEIGHT,
            ConfigurationType.PULSAR,
            MAX_GENERATION)
    end

    self.gameboard = Gameboard.new(self.configuration)
end

function Menu:handle_configuration()
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
                top = "Type",
                top_align = "center",
            },
        },
        buf_options = {
            modifiable = true,
            readonly = false,
        },
    }

    local menu_items = {}
    for _, type in pairs(ConfigurationType) do
        table.insert(menu_items, NuiMenu.item(type))
    end

    local menu_options = {
        lines = menu_items,
        on_submit = function(item)
            for _, type in pairs(ConfigurationType) do
                if item.text == type then
                    self.configuration = Configuration.new(GAMEBOARD_WIDTH, GAMEBOARD_HEIGHT, type, MAX_GENERATION)
                end
            end

            self:open()
        end
    }

    if self.menu ~= nil then
        self.menu:init(popup_options, menu_options)
    else
        local nui_menu = NuiMenu(popup_options, menu_options)
        self.menu = nui_menu
    end

    self.menu:on(NuiEvent.BufLeave, function()
        self.menu:unmount()
    end)

    self.menu:mount()
end

function Menu:handle_start()
    self:create_gameboard()
    self:create_buffer()
    self:create_window(self.gameboard.configuration.type)
    self:create_timer()

    local lines = self.gameboard:get_state_as_lines()
    vim.api.nvim_buf_set_lines(self.bufffer_id, 0, -1, false, lines)

    local generation = 0
    self.timer:start(2000, 500, vim.schedule_wrap(function()
        if generation >= self.gameboard.configuration.max_generation then
            self.timer:close()
        end

        self.gameboard:generate_next_state()
        lines = self.gameboard:get_state_as_lines()
        vim.api.nvim_buf_set_lines(self.bufffer_id, 0, -1, false, lines)
        generation = generation + 1
    end))
end

function Menu:handle_exit()
    pcall(self.timer.close, self.timer)
    pcall(vim.api.nvim_win_close, self.window_id, true)
    pcall(vim.api.nvim_buf_delete, self.bufffer_id, { force = true })
    pcall(self.menu.unmount, self.menu)

    for key, _ in pairs(self) do
        self[key] = nil
    end
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

    if self.menu ~= nil then
        self.menu:init(popup_options, menu_options)
    else
        local nui_menu = NuiMenu(popup_options, menu_options)
        self.menu = nui_menu
        self.menu:on(NuiEvent.BufLeave, function()
            self.menu:unmount()
        end)
    end

    self.menu:mount()
end

---Creates a new Menu instance
---@return Menu Menu
Menu.new = function()
    local instance = setmetatable({
        gameboard = nil,
        buffer_id = nil,
        window_id = nil,
        timer = nil,
        configuration = nil,
        menu = nil
    }, Menu)

    return instance
end

return Menu
