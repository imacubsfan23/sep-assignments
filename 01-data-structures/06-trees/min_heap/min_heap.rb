require_relative 'node'

class MinHeap
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    placed = nil
    children = [root].flatten
    row = []
    children.each do |child|
      if !child.left
        child.left = node
        node.parent = child
        placed = node
        break
      elsif !child.right
        child.right = node
        node.parent = child
        placed = node
        break
      else
        row.push(child.left)
        row.push(child.right)
      end
    end
    placed ? order(placed) : insert(row, node)
  end

  def order(node)
    if node != @root && node.rating < node.parent.rating
        parent = node.parent
        grandparent = parent.parent if parent.parent
        l = node.left
        r = node.right
        
        other_child = (parent.left == node ? node.parent.right : node.parent.left)
        if other_child
          parent.left == node ? node.right = other_child : node.left = other_child
          other_child.parent = node
        end
        
        parent.left == node ? node.left = parent : node.right = parent
        parent.parent = node
        
        l.parent = parent if l
        r.parent = parent if r
        parent.left = l
        parent.right = r
        
        if grandparent
            grandparent.left = node if grandparent.left == parent
            grandparent.right = node if grandparent.right == parent
        end
        
        @root = node if !grandparent
        node.parent = grandparent
        
        order(node)
    end
  end

  def find(node, target)
    return nil if !node || !target 
    return node if node.title == target
    right = find(node.right, target)
    left = find(node.left, target)
    right ? right : left ? left : nil
  end

  def delete(root, data)
    temp = find(root, data)
    return nil if temp == nil
    rep = grab_last()
    if rep != temp
      rep.parent.right = nil if rep.parent.right == rep
      rep.parent.left = nil if rep.parent.left == rep
      
      if temp.parent
        rep.parent = temp.parent
        temp.parent.left == temp ? temp.parent.left = rep : temp.parent.right = rep
      else
        rep.parent = nil
        @root = rep
      end
      
      rep.left = temp.left
      rep.right = temp.right
      temp.left.parent = rep if temp.left
      temp.right.parent = rep if temp.right
      
      order(rep)
      lower(rep) if (rep.left && rep.rating > rep.left.rating) || (rep.right && rep.rating > rep.right.rating)
    else
      temp.parent.left == temp ? temp.parent.left = nil : temp.parent.right = nil
      temp = nil
    end
  end

  def lower(node)
    if node.left
      if !node.right || node.left.rating < node.right.rating
        temp_left = node.left
        temp_left.left.parent = node if temp_left.left
        node.left = temp_left.left
        temp_left.left = node
        temp_left.right.parent = node if temp_left.right
        temp_right = node.right
        node.right = temp_left.right
        temp_left.right = temp_right
        temp_right.parent = temp_left
      else
        temp_left = node.right
        temp_right = node.left
        temp_left.left.parent = node
        temp_left.right.parent = node
        node.right = temp_left.right
        node.left.parent = temp_left
        node.left = temp_left.left
        temp_left.left = temp_right
        temp_left.right = node
      end

      node.parent ? (node.parent.left == node ? node.parent.left = temp_left : node.parent.right = temp_left) : @root = temp_left
      temp_left.parent = node.parent
      node.parent = temp_left

      lower(node) if (node.left && node.rating > node.left.rating) || (node.right && node.rating > node.right.rating)
    end
  end


  def grab_last(children=nil)
    children = [@root] if !children
    row = []
    children.each do |child|
      row.push(child.left) if child.left
      row.push(child.right) if child.right
    end
    return children[-1] if row.empty?
    grab_last(row)
  end

  def printf(children=nil)
    if !children
        return nil if !@root
        children = [@root]
    end
    row = []
    children.each do |child|
      puts "#{child.title}: #{child.rating}"
      row.push(child.left) if child.left != nil
      row.push(child.right) if child.right != nil
    end
    return nil if row.empty?
    printf(row)
  end
end

=begin
root = Node.new("The Internship", 35)
tree = MinHeap.new(root)

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