-- IfElse
--

local bret = require 'behavior3.behavior_ret'

local function child_ret(node, env, idx)
    local r = node.children[idx]:run(env)
    return r == bret.RUNNING and node:yield(env, idx) or r
end

local function ifelse(node, env, ret)
    if ret == bret.RUNNING then
        return ret
    end
    if ret == bret.SUCCESS then
        return child_ret(node, env, 2)
    elseif node.children[3] then
        return child_ret(node, env, 3)
    else
        return bret.FAIL
    end
end

---@type BehaviorNodeDefine
local M = {
    name = 'IfElse',
    type = 'Composite',
    desc = 'If condition',
    doc = [[
        + Has three child nodes (at least two)
        + When the first child node returns SUCCESS, execute the second child node and return its return value
        + Otherwise, execute the third child node and return its return value. If there is no third child node, return FAIL
    ]],
    run = function(node, env)
        assert(#node.children >= 2, "at least two children")

        local last_idx, last_ret = node:resume(env)
        if last_ret == bret.RUNNING then
            return last_ret
        end
        if last_idx == 1 then
            return ifelse(node, env, last_ret)
        elseif last_idx == 2 or last_idx == 3 then
            return last_ret
        end

        local r = node.children[1]:run(env)
        if r == bret.RUNNING then
            return node:yield(env, 1)
        end
        return ifelse(node, env, r)
    end
}

return M
