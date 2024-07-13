-- Selector
--

local bret = require 'behavior3.behavior_ret'

---@type BehaviorNodeDefine
local M = {
    name = 'Selector',
    type = 'Composite',
    desc = 'Select execution',
    doc = [[
        + Keep executing downwards, return success if any child node returns success, return failure if all child nodes return failure
        + Child nodes have an OR relationship
    ]],
    run = function(node, env)
        local last_idx, last_ret = node:resume(env)
        if last_idx then
            if last_ret == bret.SUCCESS then
                return last_ret
            elseif last_ret == bret.FAIL then
                last_idx = last_idx + 1
            else
                error(string.format("%s->${%s}#${$d}: unexpected status error",
                    node.tree.name, node.name, node.id))
            end
        else
            last_idx = 1
        end

        for i = last_idx, #node.children do
            local child = node.children[i]
            local r = child:run(env)
            if r == bret.RUNNING then
                return node:yield(env, i)
            end
            if r == bret.SUCCESS then
                return r
            end
        end
        return bret.FAIL
    end
}

return M
