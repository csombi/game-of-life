package.path = package.path .. ";../src/?.lua"

local Configuration = require("confiugration")
local ConfigurationType = require("configuration_type")
local StateMatrix = require("state_matrix")

describe("Configuration", function()
    it("should initialize correctly", function()
        local instance = Configuration.new(4, 5, ConfigurationType.BLOCK)
        assert.are.equal(4, instance.width)
        assert.are.equal(5, instance.height)
        assert.are.equal(ConfigurationType.BLOCK, instance.type)
    end)
end)

describe("BLOCK Configuration", function()
    it("should generate BLOCK initial state", function()
        local instance = Configuration.new(4, 4, ConfigurationType.BLOCK)
        local state = StateMatrix.new({
            { 0, 0, 0, 0 },
            { 0, 1, 1, 0 },
            { 0, 1, 1, 0 },
            { 0, 0, 0, 0 },
        })
        assert.are.same(state, instance:get_initial_state())
    end)

    it("should generate BLOCK initial state for odd width and height", function()
        local instance = Configuration.new(5, 5, ConfigurationType.BLOCK)
        local state = StateMatrix.new({
            { 0, 0, 0, 0, 0 },
            { 0, 1, 1, 0, 0 },
            { 0, 1, 1, 0, 0 },
            { 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0 },
        })
        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate BLOCK initial state since small width", function()
        assert.has_error(function() Configuration.new(3, 4, ConfigurationType.BLOCK) end)
    end)

    it("should not generate BLOCK initial state since small height", function()
        assert.has_error(function() Configuration.new(4, 3, ConfigurationType.BLOCK) end)
    end)
end)

describe("BEEHIVE Confiugration", function()
    it("should generate BEEHIVE initial state", function()
        local instance = Configuration.new(6, 5, ConfigurationType.BEEHIVE)
        local state = StateMatrix.new({
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 1, 0, 0, 1 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 0, 0, 0, 0 }
        })
        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate BEEHIVE initial state since small width", function()
        assert.has_error(function() Configuration.new(5, 5, ConfigurationType.BEEHIVE) end)
    end)

    it("should not generate BEEHIVE initial state since small height", function()
        assert.has_error(function() Configuration.new(6, 4, ConfigurationType.BEEHIVE) end)
    end)
end)

describe("LOAF Confiugration", function()
    it("should generate LOAF initial state", function()
        local instance = Configuration.new(6, 6, ConfigurationType.LOAF)
        local state = StateMatrix.new({
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 1, 0, 0, 1 },
            { 0, 0, 0, 1, 0, 1 },
            { 0, 0, 0, 0, 1, 0 },
        })
        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate LOAF initial state since small width", function()
        assert.has_error(function() Configuration.new(5, 6, ConfigurationType.LOAF) end)
    end)

    it("should not generate LOAF initial state since small height", function()
        assert.has_error(function() Configuration.new(6, 5, ConfigurationType.LOAF) end)
    end)
end)

describe("BOAT Confiugration", function()
    it("should generate BOAT initial state", function()
        local instance = Configuration.new(5, 5, ConfigurationType.BOAT)
        local state = StateMatrix.new({
            { 0, 0, 0, 0, 0 },
            { 0, 1, 1, 0, 0 },
            { 0, 1, 0, 1, 0 },
            { 0, 0, 1, 0, 0 },
            { 0, 0, 0, 0, 0 },
        })
        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate BOAT initial state since small width", function()
        assert.has_error(function() Configuration.new(4, 5, ConfigurationType.BOAT) end)
    end)

    it("should not generate BOAT initial state since small height", function()
        assert.has_error(function() Configuration.new(5, 4, ConfigurationType.BOAT) end)
    end)
end)

describe("TUB Confiugration", function()
    it("should generate TUB initial state", function()
        local instance = Configuration.new(5, 5, ConfigurationType.TUB)
        local state = StateMatrix.new({
            { 0, 0, 0, 0, 0 },
            { 0, 0, 1, 0, 0 },
            { 0, 1, 0, 1, 0 },
            { 0, 0, 1, 0, 0 },
            { 0, 0, 0, 0, 0 },
        })
        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate TUB initial state since small width", function()
        assert.has_error(function() Configuration.new(4, 5, ConfigurationType.TUB) end)
    end)

    it("should not generate TUB initial state since small height", function()
        assert.has_error(function() Configuration.new(5, 4, ConfigurationType.TUB) end)
    end)
end)
