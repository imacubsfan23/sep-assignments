require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @count = 0
    @hash = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)
    @hash[i] = LinkedList.new if @hash[i] == nil
    @hash[i].add_to_tail(Node.new(key, value))
    @count += 1
    self.resize if load_factor >= @max_load_factor
  end

  def [](key)
    i = index(key, size)
    if @hash[i]
      node = @hash[i].head
      while node
        return node.value if node.key == key
        node = node.next
      end
    end
  end
  
  def print
    @hash.each do |list|
      if list
        node = list.head
        while node
          puts "[#{node.key}] = #{node.value}"
          node = node.next
        end
      end
    end
    "Load Factor: #{load_factor}, Count: #{@count}"
  end
  
  def index(key, size)
    key.sum % size
  end

  def load_factor
    @count / size.to_f
  end

  def size
    @hash.length
  end

=begin
  def next_prime(n)
    primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199]
    i = 0
    while primes[i] < n
      i += 1
    end
    primes[i + 1]
  end
=end

  def resize
    temp = @hash
    @hash = Array.new(size * 2)
    temp.each do |list|
      if list
        node = list.head
        while node
          i = index(node.key, size)
          @hash[i] = LinkedList.new if !@hash[i]
          @hash[i].add_to_tail(Node.new(node.key, node.value))
          node = node.next
        end
      end
    end
    resize if load_factor >= @max_load_factor
  end
end