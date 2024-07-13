-- AlwaysSuccess
--

local bret = require 'behavior3.behavior_ret'

---@type BehaviorNodeDefine
local M = {
    name = 'AlwaysFail',
    type = 'Decorator',
    desc = 'Always returns failure',
    doc = [[
        + Can only have one child node, if there are multiple, only the first one is executed
        + Returns failure regardless of whether the child node succeeds
    ]],
    run = function(node, env, enemy)
        local yield, last_ret = node:resume(env)
        if yield then
            if last_ret == bret.RUNNING then
                error(string.format("%s->${%s}#${$d}: unexpected status error",
                    node.tree.name, node.name, node.id))
            end
            return bret.FAIL
        end

        local child = node.children[1]
        if not child then
            return bret.FAIL
        end
        local r = child:run(env)
        if r == bret.RUNNING then
            return node:yield(env)
        end
        return bret.FAIL
    end
}

return M
