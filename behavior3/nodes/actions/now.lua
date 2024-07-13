local bret = require "behavior3.behavior_ret"

---@type BehaviorNodeDefine
local M = {
    name = "Now",
    type = "Action",
    desc = "Get current time",
    output = { "Current time" },
    run = function(node, env)
        return bret.SUCCESS, env.ctx.time
    end
}

return M
