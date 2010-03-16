require "lib/farex.rb"

class GameOfLifeBug < Bug
  states :bool => [:dead, :alive]
  coordinates :x, :y

  condition :should_live do |env|
    env.count(&:alive?) == 3
  end
    
  condition :should_die do |env|
    env.count(&:alive?) > 4 or env.count(&:dead?) < 2
  end

  action :go_alive do |bug|
    bug.alive!
  end

  action :go_dead do |bug|
    bug.dead!
  end

  conditions :all, {
    [:should_live] => :go_alive,
    [:should_die] => :go_dead
  }

  on_creation do |grid, bug|
    grid.position bug, :x => 10, :y => 20, :z => 30
  end

  # on_departure do |grid, bug|
  #   # foo
  # end

  # conditions :any, {
  #   # ... 
  # }

  # conditions :xor, {
  #   # ... 
  # }
end

bug = GameOfLifeBug.new
bug.dead!
puts bug.inspect
bug.alive!
puts bug.inspect

grid = Grid.new(10, 10)
grid.add_bug(GameOfLifeBug)
