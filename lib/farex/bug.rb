class Bug < Agent
  def Bug.coordinates(*coords)
    attr_accessor *coords
  end

  def Bug.run_on_creation(grid, bug)
    @on_creation.call(grid, bug)
  end

  def Bug.on_creation(&block)
    @on_creation = block
  end
end
