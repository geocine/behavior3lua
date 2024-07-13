local bret = require "behavior3.behavior_ret"

---@type BehaviorNodeDefine
local M = {
    name = "Includes",
    type = "Condition",
    desc = "Check if an element is in an array",
    input = { "Array", "Element" },
    doc = [[
        + If the input element is invalid, return "Failure"
        + Return "Success" only if the array contains the element, otherwise return "Failure"
    ]],
    run = function(node, env, arr, obj)
        if not arr or #arr == 0 then
            return bret.FAIL
        end
        for _, v in ipairs(arr) do
            if v == obj then
                return bret.SUCCESS
            end
        end
        return bret.FAIL
    end,
}

return M