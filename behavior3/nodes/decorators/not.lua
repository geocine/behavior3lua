local bret = require 'behavior3.behavior_ret'

---@type BehaviorNodeDefine
local M = {
    name = 'Not',
    type = 'Decorator',
    desc = 'Negate',
    doc = [[
        + Negates the return value of the child node
    ]],
    run = function(node, env)
        local r
        if node:resume(env) then
            r = env.last_ret
        else
            r = node.children[1]:run(env)
        end

        if r == bret.SUCCESS then
            return bret.FAIL
        elseif r == bret.FAIL then
            return bret.SUCCESS
        else
            return node:yield(env)
        end
    end
}

return M
