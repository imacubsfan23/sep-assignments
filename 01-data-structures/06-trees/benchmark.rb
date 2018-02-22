require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_heap/min_heap'


root = Node.new("root", 42)
tree = BinarySearchTree.new(root)
heap = MinHeap.new(root)

n = 100000

Benchmark.bm(100) do |x|
    x.report("Tree Insert") do
        for i in 1..n do
            node = Node.new("tree", Random.rand(n))
            tree.insert(root, node)
        end
    end
    x.report("Heap Insert") do
        for i in 1..n do
            node = Node.new("heap", Random.rand(n))
            heap.insert(root, node)
        end
    end
end

target = Node.new("target", 50000)
tree.insert(root, target)
heap.insert(root, target)

Benchmark.bm(100) do |x|
    x.report("Tree Search") do
        tree.find(root, 50000)
    end
    x.report("Heap Search") do
        heap.find(root, 50000)
    end
end

Benchmark.bm(100) do |x|
    x.report("Tree Delete") do
        tree.delete(root, 50000)
    end
    x.report("Heap Delete") do
        heap.delete(root, 50000)
    end
end