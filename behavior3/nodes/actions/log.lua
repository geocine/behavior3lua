-- Log
--

local bret = require "behavior3.behavior_ret"

---@type BehaviorNodeDefine
local M = {
    name = "Log",
    type = "Action",
    desc = "Print log",
    args = {
        {
            name = "message",
            type = "string",
            desc = "Log message"
        }
    },
    run = function(node, env)
        print(node.args.message)
        return bret.SUCCESS
    end
}



return M
