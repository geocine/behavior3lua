local bret = require "behavior3.behavior_ret"

---@type BehaviorNodeDefine
local M = {
    name = "Let",
    type = "Action",
    desc = "Define a new variable name",
    input = { "Variable name" },
    output = { "New variable name" },
    run = function(node, env, value)
        return bret.SUCCESS, value
    end
}

return M