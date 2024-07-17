package.path = package.path .. ";../src/?.lua"

describe("Configuration", function()
    local Configuration = require("confiugration")
    local ConfigurationType = require("configuration_type")
    local StateMatrix = require("state_matrix")

    it("should initialize correctly", function()
        local instance = Configuration.new(1, 2, ConfigurationType.BLOCK)
        assert.are.equal(instance.width, 1)
        assert.are.equal(instance.height, 2)
        assert.are.equal(instance.type, ConfigurationType.BLOCK)
    end)

    it("should generate correct BLOCK initial state", function()
        local instance = Configuration.new(4, 4, ConfigurationType.BLOCK)
        local state = StateMatrix.new({
            { 0, 0, 0, 0 },
            { 0, 1, 1, 0 },
            { 0, 1, 1, 0 },
            { 0, 0, 0, 0 },
        })
        assert.are.same(instance:get_initial_state(), state)
    end)

    it("should generate correct BLOCK initial state for odd width and height", function()
        local instance = Configuration.new(3, 3, ConfigurationType.BLOCK)
        local state = StateMatrix.new({
            { 1, 1, 0 },
            { 1, 1, 0 },
            { 0, 0, 0 },
        })
        assert.are.same(instance:get_initial_state(), state)
    end)
end)
