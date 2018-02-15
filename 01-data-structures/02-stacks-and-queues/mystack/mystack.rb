class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack += [item]
    self.top = item
  end

  def pop
    temp = self.top
    @stack = @stack[0...@stack.length - 1]
    self.top = @stack.last
    temp
  end

  def empty?
    @stack.length == 0
  end
end