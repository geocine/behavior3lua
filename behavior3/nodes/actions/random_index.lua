local bret = require "behavior3.behavior_ret"

---@type BehaviorNodeDefine
local M = {
    name = "RandomIndex",
    type = "Action",
    desc = "Randomly return one of the inputs",
    input = { "Array" },
    output = { "Random Target" },
    doc = [[
        + Valid elements do not include nil
        + Randomly return one element from the input array
        + Returns "Failure" when the input array is empty or has no valid elements
    ]],
    run = function(node, env, arr)
        if not arr or #arr == 0 then
            return bret.FAIL
        end
        local idx = math.random(1, #arr)
        return bret.SUCCESS, arr[idx]
    end
}

return M