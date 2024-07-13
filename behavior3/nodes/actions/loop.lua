local bret = require "behavior3.behavior_ret"

local M = {
    name = "Loop",
    type = 'Action',
    desc = "Execute in a loop",
    doc = [[
        + Can only have one child node, if multiple, only the first one is executed
        + When the child node returns "Failure", exit the loop and return "Failure" status
        + In other cases, return Success/Running
    ]],
    args = {
        {
            name = "count",
            type = "int?",
            desc = "Number of iterations"
        },
    },
    input = { "Count(int)?" },
    run = function(node, env, count)
        count = count or node.args.count
        local last_i, resume_ret = node:resume(env)
        if last_i then
            if resume_ret == bret.RUNNING then
                error(string.format("%s->${%s}#${$d}: unexpected status error",
                    node.tree.name, node.name, node.id))
            elseif resume_ret == bret.FAIL then
                return bret.FAIL
            end
            last_i = last_i + 1
        else
            last_i = 1
        end

        for i = last_i, count do
            local r = node.children[1]:run(env)
            if r == bret.RUNNING then
                return node:yield(env, i)
            elseif r == bret.FAIL then
                return bret.FAIL
            end
        end
        return bret.SUCCESS
    end
}

return M
