require_relative 'node'

class OpenAddressing
  def initialize(size)
    @hash = Array.new(size)
    @count = 0
  end

  def []=(key, value)
    i = index(key, size)
    if !@hash[i]
      @hash[i] = Node.new(key, value)
      @count += 1
    elsif @hash[i].key == key && @hash[i].value == value
      return
    else
      next_index = next_open_index(i)
      if @hash[i].key == key && @hash[i].value != value && next_index == -1
        resize
        @hash[next_index].value = value
        @count += 1
      elsif next_index == -1
        resize
        self[key] = value
      else
        @hash[next_index] = Node.new(key, value)
        @hash[next_index].value = value
        @count += 1
      end
    end
  end

  def [](key)
    i = index(key, size)
    while i < size
      if @hash[i].key == key
        return @hash[i].value
      else
        i += 1
      end
    end
  end
  
  def print
    (0...size()).each do |i|
      if @hash[i] != nil
        puts "Index #{i}: [#{@hash[i].key}] = #{@hash[i].value}"
      end
    end
    puts "@count = #{@count}"
  end

  def index(key, size)
    key.sum % size
  end

  def next_open_index(index)
    while @hash[index]
      index += 1
    end
    index >= size ? -1 : index
  end

  def size
    @hash.length
  end

  def resize
    temp = @hash
    @hash = Array.new(size * 2)
    temp.each do |i|
      if i
        index = index(i.key, @hash.length)
        @hash[index] = Node.new(i.key, i.value)
      end
    end
  end
end