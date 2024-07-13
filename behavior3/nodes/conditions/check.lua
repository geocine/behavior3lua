local bret = require 'behavior3.behavior_ret'

---@type BehaviorNodeDefine
local M = {
    name = "Check",
    type = "Condition",
    desc = "Check True or False",
    args = {
        {
            name = "value",
            type = "code?",
            desc = "Value"
        },
    },
    doc = [[
        + Perform a simple numerical formula judgment, return success or failure
    ]],
    run = function(node, env)
        return node:get_env_args("value", env) and bret.SUCCESS or bret.FAIL
    end
}

return M
