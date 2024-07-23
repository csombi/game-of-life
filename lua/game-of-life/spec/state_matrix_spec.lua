package.path = package.path .. ";../../?.lua"

describe("StateMatrix", function()
    local StateMatrix = require("game-of-life.logic.state_matrix")

    it("should initilize correctly", function()
        local state = {
            { 0, 0, 0, 1 },
            { 0, 0, 1, 1 },
            { 0, 1, 1, 1 },
            { 1, 1, 1, 1 },
            { 1, 1, 1, 1 },
        }
        local instance = StateMatrix.new(state)

        assert.are.equal(4, instance.width)
        assert.are.equal(5, instance.height)
    end)

    it("should initilize correctly an empty state", function()
        local state = {
            { 0, 0 },
            { 0, 0 },
            { 0, 0 },
        }
        local instance = StateMatrix.new_empty(2, 3)

        assert.are.equal(2, instance.width)
        assert.are.equal(3, instance.height)
        assert.are.same(state, instance.state)
    end)

    it("should not equal states", function()
        local state = {
            { 0, 0, 0, 1 },
            { 0, 0, 1, 1 },
            { 0, 1, 1, 1 },
            { 1, 1, 1, 1 },
        }
        local another_state = {
            { 0, 0, 1, 1 },
            { 0, 1, 1, 1 },
        }
        local instance = StateMatrix.new(state)
        local another_instance = StateMatrix.new(another_state)

        assert.are_not.equals(instance, another_instance)
    end)

    it("should equal states", function()
        local state = {
            { 0, 0, 0, 1 },
            { 0, 0, 1, 1 },
            { 0, 1, 1, 1 },
            { 1, 1, 1, 1 },
            { 1, 1, 1, 1 },
        }
        local instance = StateMatrix.new(state)
        local another_instance = StateMatrix.new(state)

        assert.are.same(instance, another_instance)
    end)
end)
