-- Parallel
--

local bret = require 'behavior3.behavior_ret'

---@type BehaviorNodeDefine
local M = {
    name = 'Parallel',
    type = 'Composite',
    desc = 'Parallel execution',
    doc = [[
        Execute all child nodes and return success
    ]],
    run = function(node, env)
        local last_idx, last_ret = node:resume(env)
        if last_idx then
            if last_ret == bret.RUNNING then
                return last_ret
            end
            last_idx = last_idx + 1
        else
            last_idx = 1
        end

        for i = last_idx, #node.children do
            local child = node.children[i]
            local r = child:run(env)
            if r == bret.RUNNING then
                return node:yield(env, i)
            end
        end
        return bret.SUCCESS
    end
}

return M
