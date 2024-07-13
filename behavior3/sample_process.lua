return {
  -- Composite nodes
  IfElse          = require "behavior3.nodes.composites.ifelse",
  Parallel        = require "behavior3.nodes.composites.parallel",
  Selector        = require "behavior3.nodes.composites.selector",
  Sequence        = require "behavior3.nodes.composites.sequence",
  
  -- Decorator nodes
  Once               = require "behavior3.nodes.decorators.once",
  Not                = require "behavior3.nodes.decorators.not",
  Inverter           = require "behavior3.nodes.decorators.not",
  AlwaysFail         = require "behavior3.nodes.decorators.always_fail",
  AlwaysSuccess      = require "behavior3.nodes.decorators.always_success",
  RepeatUntilFailure = require "behavior3.nodes.decorators.repeat_until_fail",
  RepeatUntilSuccess = require "behavior3.nodes.decorators.repeat_until_success",

  -- Condition nodes
  Check           = require "behavior3.nodes.conditions.check",
  Cmp             = require "behavior3.nodes.conditions.cmp",
  Includes        = require "behavior3.nodes.conditions.includes",
  
  -- Action nodes
  Calculate       = require "behavior3.nodes.actions.calculate",
  Clear           = require "behavior3.nodes.actions.clear",
  Filter          = require "behavior3.nodes.actions.filter",
  ForEach         = require "behavior3.nodes.actions.foreach",
  Index           = require "behavior3.nodes.actions.index",
  Let             = require "behavior3.nodes.actions.let",
  Log             = require "behavior3.nodes.actions.log",
  Loop            = require "behavior3.nodes.actions.loop",
  Now             = require "behavior3.nodes.actions.now",
  Push            = require "behavior3.nodes.actions.push",
  Random          = require "behavior3.nodes.actions.random",
  RandomIndex     = require "behavior3.nodes.actions.random_index",
  Wait            = require "behavior3.nodes.actions.wait",
}