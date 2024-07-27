package.path = package.path .. ";../../?.lua"

local Confiugration = require("game-of-life.logic.configuration")
local ConfiugrationType = require("game-of-life.logic.configuration_type")
local StateMatrix = require("game-of-life.logic.state_matrix")
local State = require("game-of-life.logic.state")

describe("State", function()
    it("should initilize correctly", function()
        local confiugration = Confiugration.new(4, 4, ConfiugrationType.BLOCK)
        local instance = State.new(confiugration)

        assert.are.same(confiugration, instance.configuration)
        assert.are.same(confiugration:get_initial_state(), instance.state)
    end)
end)

describe("BLOCK state", function()
    it("should generate next state correctly", function()
        local confiugration = Confiugration.new(4, 4, ConfiugrationType.BLOCK)
        local instance = State.new(confiugration)
        local next_state = StateMatrix.new({
            { 0, 0, 0, 0 },
            { 0, 1, 1, 0 },
            { 0, 1, 1, 0 },
            { 0, 0, 0, 0 }
        })

        assert.are.same(next_state, instance.state)
        instance:generate_next_state()
        assert.are.same(next_state, instance.state)
    end)
end)

describe("BEEHIVE state", function()
    it("should generate next state correctly", function()
        local confiugration = Confiugration.new(6, 5, ConfiugrationType.BEEHIVE)
        local instance = State.new(confiugration)
        local next_state = StateMatrix.new({
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 1, 0, 0, 1 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 0, 0, 0, 0 }
        })

        assert.are.same(next_state, instance.state)
        instance:generate_next_state()
        assert.are.same(next_state, instance.state)
    end)
end)

describe("LOAF state", function()
    it("should generate next state correctly", function()
        local confiugration = Confiugration.new(6, 6, ConfiugrationType.LOAF)
        local instance = State.new(confiugration)
        local next_state = StateMatrix.new({
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 1, 0, 0, 1 },
            { 0, 0, 0, 1, 0, 1 },
            { 0, 0, 0, 0, 1, 0 },
        })

        assert.are.same(next_state, instance.state)
        instance:generate_next_state()
        assert.are.same(next_state, instance.state)
    end)
end)

describe("BOAT state", function()
    it("should generate next state correctly", function()
        local confiugration = Confiugration.new(5, 5, ConfiugrationType.BOAT)
        local instance = State.new(confiugration)
        local next_state = StateMatrix.new({
            { 0, 0, 0, 0, 0 },
            { 0, 1, 1, 0, 0 },
            { 0, 1, 0, 1, 0 },
            { 0, 0, 1, 0, 0 },
            { 0, 0, 0, 0, 0 },
        })

        assert.are.same(next_state, instance.state)
        instance:generate_next_state()
        assert.are.same(next_state, instance.state)
    end)
end)

describe("TUB state", function()
    it("should generate next state correctly", function()
        local confiugration = Confiugration.new(5, 5, ConfiugrationType.TUB)
        local instance = State.new(confiugration)
        local next_state = StateMatrix.new({
            { 0, 0, 0, 0, 0 },
            { 0, 0, 1, 0, 0 },
            { 0, 1, 0, 1, 0 },
            { 0, 0, 1, 0, 0 },
            { 0, 0, 0, 0, 0 },
        })

        assert.are.same(next_state, instance.state)
        instance:generate_next_state()
        assert.are.same(next_state, instance.state)
    end)
end)

describe("BLINKER state", function()
    it("should generate next state correctly", function()
        local confiugration = Confiugration.new(5, 5, ConfiugrationType.BLINKER)
        local instance = State.new(confiugration)
        local initial_state = StateMatrix.new({
            { 0, 1, 0, 0, 0 },
            { 0, 1, 0, 0, 0 },
            { 0, 1, 0, 0, 0 },
            { 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0 },
        })
        local next_state = StateMatrix.new({
            { 0, 0, 0, 0, 0 },
            { 1, 1, 1, 0, 0 },
            { 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0 },
        })

        assert.are.same(initial_state, instance.state)
        instance:generate_next_state()
        assert.are.same(next_state, instance.state)
    end)
end)

describe("TOAD state", function()
    it("should generate next state correctly", function()
        local confiugration = Confiugration.new(6, 6, ConfiugrationType.TOAD)
        local instance = State.new(confiugration)
        local initial_state = StateMatrix.new({
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 1, 1, 1 },
            { 0, 0, 1, 1, 1, 0 },
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 0, 0 },
        })
        local next_state = StateMatrix.new({
            { 0, 0, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 1, 0 },
            { 0, 0, 1, 0, 0, 1 },
            { 0, 0, 1, 0, 0, 1 },
            { 0, 0, 0, 1, 0, 0 },
            { 0, 0, 0, 0, 0, 0 },
        })

        assert.are.same(initial_state, instance.state)
        instance:generate_next_state()
        assert.are.same(next_state, instance.state)
    end)
end)

describe("BEACON state", function()
    it("should generate next state correctly", function()
        local confiugration = Confiugration.new(6, 6, ConfiugrationType.BEACON)
        local instance = State.new(confiugration)
        local initial_state = StateMatrix.new({
            { 0, 0, 0, 0, 0, 0 },
            { 0, 1, 1, 0, 0, 0 },
            { 0, 1, 1, 0, 0, 0 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 0, 0, 0, 0 },
        })
        local next_state = StateMatrix.new({
            { 0, 0, 0, 0, 0, 0 },
            { 0, 1, 1, 0, 0, 0 },
            { 0, 1, 0, 0, 0, 0 },
            { 0, 0, 0, 0, 1, 0 },
            { 0, 0, 0, 1, 1, 0 },
            { 0, 0, 0, 0, 0, 0 },
        })

        assert.are.same(initial_state, instance.state)
        instance:generate_next_state()
        assert.are.same(next_state, instance.state)
    end)
end)
