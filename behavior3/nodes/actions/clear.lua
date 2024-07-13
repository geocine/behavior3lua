local bret = require "behavior3.behavior_ret"

local M = {
    name = "Clear",
    type = "Action",
    desc = "Clear variables",
    output = { "Name of cleared variable" },
    run = function(node, env)
        return bret.SUCCESS, nil
    end
}

return M
