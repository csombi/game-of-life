package.path = package.path .. ";../logic/?.lua"

describe("ConfigurationType", function()
    local type = require("configuration_type")

    it("should return BLOCK configuration type", function()
        assert.are.equal("BLOCK", type.BLOCK)
    end)

    it("should return BEEHIVE configuration type", function()
        assert.are.equal("BEEHIVE", type.BEEHIVE)
    end)

    it("should return LOAF configuration type", function()
        assert.are.equal("LOAF", type.LOAF)
    end)

    it("should return BOAT configuration type", function()
        assert.are.equal("BOAT", type.BOAT)
    end)

    it("should return TUB configuration type", function()
        assert.are.equal("TUB", type.TUB)
    end)

    it("should return BLINKER configuration type", function()
        assert.are.equal("BLINKER", type.BLINKER)
    end)

    it("should return TOAD configuration type", function()
        assert.are.equal("TOAD", type.TOAD)
    end)

    it("should return BEACON configuration type", function()
        assert.are.equal("BEACON", type.BEACON)
    end)

    it("should return PULSAR configuration type", function()
        assert.are.equal("PULSAR", type.PULSAR)
    end)

    it("should return PENTADECATHLON configuration type", function()
        assert.are.equal("PENTADECATHLON", type.PENTADECATHLON)
    end)

    it("should return GLIDER configuration type", function()
        assert.are.equal("GLIDER", type.GLIDER)
    end)

    it("should return LIGHT_WEIGHT_SPACESHIP configuration type", function()
        assert.are.equal("LIGHT_WEIGHT_SPACESHIP", type.LIGHT_WEIGHT_SPACESHIP)
    end)

    it("should return MIDDLE_WEIGHT_SPACESHIP configuration type", function()
        assert.are.equal("MIDDLE_WEIGHT_SPACESHIP", type.MIDDLE_WEIGHT_SPACESHIP)
    end)

    it("should return HEAVY_WEIGHT_SPACESHIP configuration type", function()
        assert.are.equal("HEAVY_WEIGHT_SPACESHIP", type.HEAVY_WEIGHT_SPACESHIP)
    end)
end)
