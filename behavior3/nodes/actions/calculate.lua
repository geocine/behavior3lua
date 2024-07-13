local bret = require "behavior3.behavior_ret"

---@type BehaviorNodeDefine
local M = {
    name = "Calculate",
    type = "Action",
    desc = "Calculate formula",
    args = {
        {
            name = "value",
            type = "code?",
            desc = "Formula"
        },
    },
    doc = [[
        + Perform simple numerical formula calculation
    ]],
    run = function(node, env)
        local value = node:get_env_args("value", env)
        return bret.SUCCESS, value
    end,
}

return M