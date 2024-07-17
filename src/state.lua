local configuration = require("confiugration")

---@class State
local State = {}
State.__index = State


---@param confiugration Configuration
---@return State
State.new = function(confiugration)
    local instance = setmetatable({
        configuration = configuration
    }, State)
    return instance
end

State.generate_next = function()
    -- TODO
end
