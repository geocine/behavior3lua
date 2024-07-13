local bret = require "behavior3.behavior_ret"

---@type BehaviorNodeDefine
local M = {
    name = "Index",
    type = "Action",
    desc = "Index the input array or object",
    args = {
        {
            name = "idx",
            type = "string",
            desc = "Index",
        }
    },
    input = { "Array", "Index?" },
    output = { "Element" },
    doc = [[
        + Valid elements do not include undefined and null
        + Only returns "Success" when indexing a valid element, otherwise returns "Failure"
    ]],
    run = function(node, env, arr, key)
        if not arr then
            return bret.FAIL
        end
        local value
        if #arr > 0 then
            local idx = key or tonumber(node.args.idx)
            if type(key) ~= "number" then
                print(string.format("%s->${%s}#${$d}: index type error",
                    node.tree.name, node.name, node.id))
            end
            value = arr[idx]
        else
            value = arr[key or node.args.idx]
        end

        if value == nil then
            return bret.FAIL
        end
        return bret.SUCCESS, value
    end,
}

return M