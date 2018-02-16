require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)
    if @items[i] == nil
      @items[i] = HashItem.new(key, value)
    elsif @items[i].key == key && @items[i].value == value
      "duplicate"
    else
      # resize until collision is fixed
      while true do
        resize
        j = index(key, size)
        break if @items[j] == nil || @items[j].key == key
      end
      j = index(key, size)
      if @items[j] == nil
        @items[j] = HashItem.new(key, value)
      else
        @items[j].value = value
      end
    end
  end


  def [](key)
    i = index(key, size)
    @items[i].value if @items[i]
  end

  def resize
    arr = Array.new(@items.length * 2)
    (0...@items.length).each do |i|
      if @items[i]
        index = @items[i].key.sum % arr.length
        arr[index] = @items[i]
        @items[i] = nil
      end
    end
    @items = arr
  end

  def index(key, size)
    key.sum % size
  end

  def size
    @items.length
  end

end