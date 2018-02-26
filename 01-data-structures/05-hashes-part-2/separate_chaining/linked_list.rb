require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def add_to_tail(node)
    self.head = node if self.head == nil
    self.tail.next = node if self.tail
    self.tail = node
  end

  def remove_tail
    return if self.tail == nil
    if self.head == self.tail
      self.head = nil
      self.tail = nil
    else
      temp = self.head
      while temp && temp.next != self.tail
        temp = temp.next
      end
      temp.next = nil
      self.tail = temp
    end
  end

  def print
    str = ""
    temp = self.head
    while temp
      str +=  "#{temp.data}\n"
      temp = temp.next
    end
    puts str
  end

  def delete(node)
    if node == self.head
      self.head = self.head.next
    elsif node == self.tail
      remove_tail
    else
      temp = self.head
      while temp && temp.next != node
        temp = temp.next
      end
      temp.next = node.next
    end
  end

  def add_to_front(node)
    temp = self.head
    self.head = node
    self.head.next = temp
  end

  def remove_front
    temp = self.head
    self.head = self.head.next
    temp
  end
end