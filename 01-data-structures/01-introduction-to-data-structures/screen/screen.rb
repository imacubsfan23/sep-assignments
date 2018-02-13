require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = []
    width.times do |i|
      temp_array = []
      height.times do |j|
        temp_array.push(nil)
      end
      self.matrix.push(temp_array)
    end
  end
  
  def insert(pixel, x, y)
    self.matrix[x][y] = pixel if inbounds(x, y)
  end

  def at(x, y)
    self.matrix[x][y] ? self.matrix[x][y] : nil
  end

  private

  def inbounds(x, y)
    x >= 0 && x < self.width && y >= 0 && y < self.height
  end

end