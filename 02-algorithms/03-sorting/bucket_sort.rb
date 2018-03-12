def bucket_sort(arr, bucket_size=5)
  return arr if arr.empty? || arr.length == 1
  min = arr.min
  max = arr.max
  buckets = Array.new(((max - min) / bucket_size).ceil + 1)
  (0...buckets.length).each{ |i| buckets[i] = [] }
  (0...arr.length).each{ |i| buckets[((arr[i] - min) / bucket_size).floor].push(arr[i]) }
  
  arr = []
  (0...buckets.length).each do |i|
    buckets[i] = insertion_sort(buckets[i])
    buckets[i].each{ |value| arr.push(value) }
  end
  arr
end

def insertion_sort(collection)
  sorted_array = [collection.delete_at(0)]
  until collection.length == 0
    insert_value = collection.shift
    i = 0
    until i == sorted_array.length || insert_value < sorted_array[i]
      i += 1
    end
    sorted_array.insert(i, insert_value)
  end
  sorted_array
end