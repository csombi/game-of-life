package.path = package.path .. ";../logic/?.lua"

local Confiugration = require("confiugration")
local ConfiugrationType = require("configuration_type")
local StateMatrix = require("state_matrix")
local State = require("state")

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
