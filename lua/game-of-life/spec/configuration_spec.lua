package.path = package.path .. ";../../?.lua"

local Configuration = require("game-of-life.logic.configuration")
local ConfigurationType = require("game-of-life.logic.configuration_type")

describe("Configuration", function()
    it("should initialize correctly", function()
        local instance = Configuration.new(4, 5, ConfigurationType.BLOCK, 40)
        assert.are.equal(4, instance.width)
        assert.are.equal(5, instance.height)
        assert.are.equal(ConfigurationType.BLOCK, instance.type)
        assert.are.equal(40, instance.max_generation)
    end)
end)

describe("BLOCK Configuration", function()
    it("should generate BLOCK initial state", function()
        local instance = Configuration.new(4, 4, ConfigurationType.BLOCK)
        local state = {
            { 0, 0, 0, 0 },
            { 0, 1, 1, 0 },
            { 0, 1, 1, 0 },
            { 0, 0, 0, 0 },
        }

        assert.are.same(state, instance:get_initial_state())
    end)

    it("should generate BLOCK initial state for odd width and height", function()
        local instance = Configuration.new(5, 5, ConfigurationType.BLOCK)
        local state = {
            { 0, 0, 0, 0, 0 },
            { 0, 1, 1, 0, 0 },
            { 0, 1, 1, 0, 0 },
            { 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0 },
        }

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
        local state = {
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 1, 0, 0, 1 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 0, 0, 0, 0 }
        }

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
        local state = {
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 1, 0, 0, 1 },
            { 0, 0, 0, 1, 0, 1 },
            { 0, 0, 0, 0, 1, 0 },
        }

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
        local state = {
            { 0, 0, 0, 0, 0 },
            { 0, 1, 1, 0, 0 },
            { 0, 1, 0, 1, 0 },
            { 0, 0, 1, 0, 0 },
            { 0, 0, 0, 0, 0 },
        }

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
        local state = {
            { 0, 0, 0, 0, 0 },
            { 0, 0, 1, 0, 0 },
            { 0, 1, 0, 1, 0 },
            { 0, 0, 1, 0, 0 },
            { 0, 0, 0, 0, 0 },
        }

        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate TUB initial state since small width", function()
        assert.has_error(function() Configuration.new(4, 5, ConfigurationType.TUB) end)
    end)

    it("should not generate TUB initial state since small height", function()
        assert.has_error(function() Configuration.new(5, 4, ConfigurationType.TUB) end)
    end)
end)

describe("BLINKER Confiugration", function()
    it("should generate BLINKER initial state", function()
        local instance = Configuration.new(5, 5, ConfigurationType.BLINKER)
        local state = {
            { 0, 1, 0, 0, 0 },
            { 0, 1, 0, 0, 0 },
            { 0, 1, 0, 0, 0 },
            { 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0 },
        }

        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate BLINKER initial state since small width", function()
        assert.has_error(function() Configuration.new(4, 5, ConfigurationType.BLINKER) end)
    end)

    it("should not generate BLINKER initial state since small height", function()
        assert.has_error(function() Configuration.new(5, 4, ConfigurationType.BLINKER) end)
    end)
end)

describe("TOAD Confiugration", function()
    it("should generate TOAD initial state", function()
        local instance = Configuration.new(6, 6, ConfigurationType.TOAD)
        local state = {
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 1, 1 },
            { 0, 0, 1, 1, 1, 0 },
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0 },
        }

        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate TOAD initial state since small width", function()
        assert.has_error(function() Configuration.new(5, 6, ConfigurationType.TOAD) end)
    end)

    it("should not generate TOAD initial state since small height", function()
        assert.has_error(function() Configuration.new(6, 5, ConfigurationType.TOAD) end)
    end)
end)

describe("BEACON Confiugration", function()
    it("should generate BEACON initial state", function()
        local instance = Configuration.new(6, 6, ConfigurationType.BEACON)
        local state = {
            { 0, 0, 0, 0, 0, 0 },
            { 0, 1, 1, 0, 0, 0 },
            { 0, 1, 1, 0, 0, 0 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 0, 0, 0, 0 },
        }

        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate BEACON initial state since small width", function()
        assert.has_error(function() Configuration.new(5, 6, ConfigurationType.BEACON) end)
    end)

    it("should not generate BEACON initial state since small height", function()
        assert.has_error(function() Configuration.new(6, 5, ConfigurationType.BEACON) end)
    end)
end)

describe("PULSAR Confiugration", function()
    it("should generate PULSAR initial state", function()
        local instance = Configuration.new(17, 17, ConfigurationType.PULSAR)
        local state = {
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0 },
            { 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0 },
            { 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0 },
            { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
            { 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0 },
            { 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0 },
            { 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
        }

        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate PULSAR initial state since small width", function()
        assert.has_error(function() Configuration.new(16, 17, ConfigurationType.PULSAR) end)
    end)

    it("should not generate PULSAR initial state since small height", function()
        assert.has_error(function() Configuration.new(17, 16, ConfigurationType.PULSAR) end)
    end)
end)

describe("PENTADECATHLON Confiugration", function()
    it("should generate PENTADECATHLON initial state", function()
        local instance = Configuration.new(11, 18, ConfigurationType.PENTADECATHLON)
        local state = {
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
        }

        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate PENTADECATHLON initial state since small width", function()
        assert.has_error(function() Configuration.new(10, 18, ConfigurationType.PENTADECATHLON) end)
    end)

    it("should not generate PENTADECATHLON initial state since small height", function()
        assert.has_error(function() Configuration.new(11, 17, ConfigurationType.PENTADECATHLON) end)
    end)
end)

describe("GLIDER Confiugration", function()
    it("should generate GLIDER initial state", function()
        local instance = Configuration.new(6, 6, ConfigurationType.GLIDER)
        local state = {
            { 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 1, 0, 0, },
            { 0, 0, 0, 0, 1, 0, },
            { 0, 0, 1, 1, 1, 0, },
            { 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, },
        }

        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate GLIDER initial state since small width", function()
        assert.has_error(function() Configuration.new(5, 6, ConfigurationType.GLIDER) end)
    end)

    it("should not generate GLIDER initial state since small height", function()
        assert.has_error(function() Configuration.new(6, 5, ConfigurationType.GLIDER) end)
    end)
end)

describe("LIGHT_WEIGHT_SPACESHIP Confiugration", function()
    it("should generate LIGHT_WEIGHT_SPACESHIP initial state", function()
        local instance = Configuration.new(20, 20, ConfigurationType.LIGHT_WEIGHT_SPACESHIP)
        local state = {
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
        }

        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate LIGHT_WEIGHT_SPACESHIP initial state since small width", function()
        assert.has_error(function() Configuration.new(19, 20, ConfigurationType.LIGHT_WEIGHT_SPACESHIP) end)
    end)

    it("should not generate LIGHT_WEIGHT_SPACESHIP initial state since small height", function()
        assert.has_error(function() Configuration.new(20, 19, ConfigurationType.LIGHT_WEIGHT_SPACESHIP) end)
    end)
end)

describe("MIDDLE_WEIGHT_SPACESHIP Confiugration", function()
    it("should generate MIDDLE_WEIGHT_SPACESHIP initial state", function()
        local instance = Configuration.new(20, 20, ConfigurationType.MIDDLE_WEIGHT_SPACESHIP)
        local state = {
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
        }

        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate MIDDLE_WEIGHT_SPACESHIP initial state since small width", function()
        assert.has_error(function() Configuration.new(19, 20, ConfigurationType.MIDDLE_WEIGHT_SPACESHIP) end)
    end)

    it("should not generate MIDDLE_WEIGHT_SPACESHIP initial state since small height", function()
        assert.has_error(function() Configuration.new(20, 19, ConfigurationType.MIDDLE_WEIGHT_SPACESHIP) end)
    end)
end)

describe("HEAVY_WEIGHT_SPACESHIP Confiugration", function()
    it("should generate HEAVY_WEIGHT_SPACESHIP initial state", function()
        local instance = Configuration.new(20, 20, ConfigurationType.HEAVY_WEIGHT_SPACESHIP)
        local state = {
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
        }

        assert.are.same(state, instance:get_initial_state())
    end)

    it("should not generate HEAVY_WEIGHT_SPACESHIP initial state since small width", function()
        assert.has_error(function() Configuration.new(19, 20, ConfigurationType.HEAVY_WEIGHT_SPACESHIP) end)
    end)

    it("should not generate HEAVY_WEIGHT_SPACESHIP initial state since small height", function()
        assert.has_error(function() Configuration.new(20, 19, ConfigurationType.HEAVY_WEIGHT_SPACESHIP) end)
    end)
end)
