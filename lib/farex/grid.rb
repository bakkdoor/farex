class Grid
  attr_accessor :x_size, :y_size, :z_size, :agents

  def initialize(x_size, y_size = 0, z_size = 0)
    @x_size = x_size
    @y_size = y_size
    @z_size = z_size

    y_arr = nil
    if y_size != 0
      y_arr = Array.new(y_size)
    end

    z_arr = nil
    if z_size != 0
      z_arr = Array.new(z_size)
      y_arr = Array.new(y_size, z_arr.clone)
    end

    @grid = Array.new(x_size, y_arr.clone)
    @bugs = []
  end

  def add_bug(bug_class, *args)
    if bug_class.is_a?(Class)
      bug = bug_class.new(*args)
      @bugs << bug
      if block_given?
        bug_class.run_on_creation(self, bug)
      end
    end
  end
end
