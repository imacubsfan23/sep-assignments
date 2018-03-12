require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'

array = (1..50).to_a.shuffle!

Benchmark.bm(1000) do |x|
    x.report("bucket sort") do
        bucket_sort(array)
    end
    array.shuffle
    x.report("heap sort") do
        heap_sort(array)
    end
    array.shuffle
    x.report("quick sort") do
        quick_sort(array, 0, 50)
    end
    array.shuffle
end