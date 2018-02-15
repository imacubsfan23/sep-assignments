class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue.last
  end

  def enqueue(element)
    @queue += [element]
    @head = @queue.first
    @tail = element
  end

  def dequeue
    temp = @head
    @queue = @queue[1...@queue.length]
    @head = @queue.first
    temp
  end

  def empty?
    @queue.length == 0
  end
end