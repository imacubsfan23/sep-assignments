def binary_search_recursive(collection, value)
  return nil if collection.empty?
  mid = collection.length / 2
  if collection[mid] < value
    binary_search_recursive(collection[mid+1..collection.length], value)
  elsif collection[mid] > value
    binary_search_recursive(collection[0...mid], value)
  else
    return collection[mid]
  end
end

p binary_search_recursive([0,1,2,3,4,5,6,7,8,9,10,11], 0) #0
p binary_search_recursive([0,1,2,3,4,5,6,7,8,9,10,11], 11) #11
p binary_search_recursive([0, 2], 1) #nil