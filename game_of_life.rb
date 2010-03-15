require "lib/agent.rb"

class GameOfLifeAgent < Agent
  states :bool => [:dead, :alive]

  condition :should_live do |env|
    env.count(&:alive?) == 3
  end
    
  condition :should_die do |env|
    env.count(&:alive?) > 4 or env.count(&:dead?) < 2
  end

  action :go_alive do |agent|
    agent.alive!
  end

  action :go_dead do |agent|
    agent.dead!
  end

  conditions :all, {
    [:should_live] => :go_alive,
    [:should_die] => :go_dead
  }

  # conditions :any, {
  #   # ... 
  # }

  # conditions :xor, {
  #   # ... 
  # }
end

agent = GameOfLifeAgent.new
agent.dead!
puts agent.inspect
agent.alive!
puts agent.inspect
