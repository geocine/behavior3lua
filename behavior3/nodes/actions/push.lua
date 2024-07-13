local bret = require "behavior3.behavior_ret"

local M = {
    name = "Push",
    type = "Action",
    desc = "Add an element to an array",
    input = { "Array", "Element" },
    doc = [[
        + Returns "Failure" when the input "Array" is not an array type
        + Otherwise returns "Success".
    ]],
    run = function(node, env, arr, value)
        if not arr then
            return bret.FAIL
        end
        arr[#arr+1] = value
        return bret.SUCCESS
    end
}

return M