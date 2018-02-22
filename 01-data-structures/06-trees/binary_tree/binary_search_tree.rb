require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating > root.rating
      root.right ? insert(root.right, node) : root.right = node
    elsif node.rating < root.rating
      root.left ? insert(root.left, node) : root.left = node
    end
  end

  def find(root, data)
    return nil if !root || !data
    return root if root.title == data
    right = find(root.right, data) 
    right ? right : find(root.left, data)
  end

  def delete(root, data)
    return nil if !root || !data
    node = find(root, data)
    node ? (node.title = nil && node.rating = nil) : nil
  end

  def printf(children=nil)
    children = [@root] if children == nil
    row = []
    children.each do |child|
      puts "#{child.title}: #{child.rating}"
      row.push(child.left) if child.left
      row.push(child.right) if child.right
    end
    row.length == 0 ? nil : printf(row)
  end
end

=begin
root = Node.new("The Internship", 35)
tree = BinarySearchTree.new(root)

tree.insert(root, Node.new("Space Balls", 57))
tree.insert(root, Node.new("Back to the Future", 96))
tree.insert(root, Node.new("Back to the Future Part II", 63))
tree.insert(root, Node.new("Back to the Future III", 74))
tree.insert(root, Node.new("The Maze Runner", 65))
tree.insert(root, Node.new("Maze Runner: The Scorch Trials", 46))
tree.insert(root, Node.new("Maze Runner: The Death Cure", 43))
tree.insert(root, Node.new("The Circle", 16))
tree.insert(root, Node.new("Lion", 86))
tree.insert(root, Node.new("Star Wars: The Force Awakens", 93))
tree.insert(root, Node.new("Star Wars: The Last Jedi", 91))

tree.printf
=end