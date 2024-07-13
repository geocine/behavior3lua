-- Cmp

local bret = require 'behavior3.behavior_ret'

local function ret(r)
    return r and bret.SUCCESS or bret.FAIL
end

---@type BehaviorNodeDefine
local M = {
    name = 'Cmp',
    type = 'Condition',
    desc = 'Compare value size',
    args = {
        { name = 'value', type = 'code?', desc = 'Value' },
        { name = 'gt', type = 'int?', desc = '>' },
        { name = 'ge', type = 'int?', desc = '>=' },
        { name = 'eq', type = 'int?', desc = '==' },
        { name = 'le', type = 'int?', desc = '<=' },
        { name = 'lt', type = 'int?', desc = '<' }
    },
    input = { 'Value(int)' },
    doc = [[
        + If the value is empty, return failure
        + Non-integer types may report errors
    ]],
    run = function(node, env, value)
        value = value or node:get_env_args("value", env)
        assert(type(value) == 'number')
        local args = node.args
        if args.gt then
            return ret(value > args.gt)
        elseif args.ge then
            return ret(value >= args.ge)
        elseif args.eq then
            return ret(value == args.eq)
        elseif args.lt then
            return ret(value < args.lt)
        elseif args.le then
            return ret(value <= args.le)
        else
            error('args error')
        end
    end
}

return M
