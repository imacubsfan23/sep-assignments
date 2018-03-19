require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'

array = (1..50).to_a.shuffle!

Benchmark.bm(10) do |x|
    x.report("bucket sort") do
        bucket_array = array.dup
        bucket_sort(bucket_array)
    end
    x.report("heap sort") do
        heap_array = array.dup
        heap_sort(heap_array)
    end
    x.report("quick sort") do
        quick_array = array.dup
        quick_sort(quick_array, 0, 50)
    end
end