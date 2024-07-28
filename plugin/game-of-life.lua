if vim.g.loaded_game_of_life == 1 then
    return
end

vim.g.loaded_game_of_life = 1

local game_of_life = require("game-of-life")
local instance = nil

vim.api.nvim_create_user_command("GoL", function()
    if not instance then
        instance = game_of_life.new()
    end

    instance:open()
end, {})

vim.api.nvim_create_user_command("GoLMenu", function()
    if not instance then
        instance = game_of_life.new()
    end

    instance:open()
end, {})

vim.api.nvim_create_user_command("GoLExit", function()
    if not instance then
        return
    end

    instance:close()
end, {})
