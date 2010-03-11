require "lib/agent.rb"

def_agent "Schorsch" do |a|
  a.states :bool => [:dead, :alive]

  a.condition :should_live do |env|
    env.count(&:alive?) == 3
  end
    
  a.condition :should_die do |env|
    env.count(&:alive?) > 4 or env.count(&:dead?) < 2
  end

  a.action :go_alive do |agent|
    agent.alive!
  end

  a.action :go_dead do |agent|
    agent.dead!
  end

  a.conditions :all, {
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

# agent = Agent["Schorsch"].new
# agent.dead!
# puts agent.inspect
# agent.alive!
# puts agent.inspect
