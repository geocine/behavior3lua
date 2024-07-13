---@enum BehaviorTreeEvent
local BehaviorTreeEvent = {
    INTERRUPTED = "treeInterrupted",           -- Behavior tree interrupted
    BEFORE_RUN = "beforeRunTree",              -- Before behavior tree starts execution
    AFTER_RUN = "afterRunTree",                -- After behavior tree execution completes
    AFTER_RUN_SUCCESS = "afterRunTreeSuccess", -- After behavior tree execution succeeds
    AFTER_RUN_FAILURE = "afterRunTreeFailure", -- After behavior tree execution fails
}

return BehaviorTreeEvent
