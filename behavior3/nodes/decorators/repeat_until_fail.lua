local bret = require "behavior3.behavior_ret"

---@type BehaviorNodeDefine
local M = {
    name = "RepeatUntilFailure",
    type = "Decorator",
    desc = "Keep trying until the child node returns failure",
    input = { "Maximum number of loops?" },
    args = {
        {
            name = "maxLoop",
            type = "int?",
            desc = "Maximum number of loops"
        }
    },
    doc = [[
        + Can only have one child node, if there are multiple, only the first one is executed
        + Only returns success when the child node returns failure, otherwise returns running status
        + If the number of attempts is set, it returns failure after exceeding the specified number of attempts
    ]],
    run = function(node, env, max_loop)
        max_loop = max_loop or node.args.maxLoop or math.maxinteger

        local count, resume_ret = node:resume(env)
        if count then
            if resume_ret == bret.FAIL then
                return bret.SUCCESS
            elseif count >= max_loop then
                return bret.FAIL
            else
                count = count + 1
            end
        else
            count = 1
        end

        local r = node.children[1]:run(env)
        if r == bret.FAIL then
            return bret.SUCCESS
        else
            return node:yield(env, count)
        end
    end
}

return M
