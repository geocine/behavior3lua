local bret = require "behavior3.behavior_ret"

---@type BehaviorNodeDefine
local M = {
    name = "Random",
    type = "Action",
    desc = "Return a random number",
    input = { "Minimum value?", "Maximum value?" },
    output = { "Random number" },
    args = {
        {
            name = "min",
            type = "float?",
            desc = "Minimum value"
        },
        {
            name = "max",
            type = "float?",
            desc = "Maximum value"
        },
        {
            name = "floor",
            type = "bool?",
            desc = "Whether to round down"
        }
    },
    run = function(node, env, min, max)
        min = min or node.args.min
        max = max or node.args.max
        local value = min + math.random() * (max - min)
        if node.args.floor then
            value = math.floor(value)
        end
        return bret.SUCCESS, value
    end
}

return M