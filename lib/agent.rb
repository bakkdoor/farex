class Agent
  @@conditions = {}
  @@actions = {}
  @@conditions_all = nil
  @@conditions_any = nil
  @@conditions_xor = nil

  attr_accessor :state

  def Agent.[](agent_name)
    @@agents[agent_name]
  end
  
  def Agent.states(states_hash)
    if states_hash[:bool]
      states_hash[:bool].each do |state|
        define_method("#{state}?") do
          @state == state
        end
        define_method("#{state}!") do
          instance_variable_set("@state", state)
        end
      end
    end
  end

  def Agent.condition(name, &block)
    @@conditions[name] = block
  end

  def Agent.action(name, &block)
    @@actions[name] = block
  end

  def Agent.conditions(logical_op, conditions_to_action)
    case logical_op
    when :all
      @@conditions_all = conditions_to_action
    when :any
      @@conditions_any = conditions_to_action
    when :xor
      @@conditions_xor = conditions_to_action
    else
      puts "OHOH!"
    end
  end
end
