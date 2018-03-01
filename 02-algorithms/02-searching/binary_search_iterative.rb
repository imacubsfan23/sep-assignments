def binary_search_iterative(collection, value)
    low = 0
    high = collection.length - 1
    while low <= high
        mid = (low + high) / 2
        if collection[mid] > value
            high = mid - 1
        elsif collection[mid] < value
            low = mid + 1
        else
            return mid
        end
    end
    nil
end

p binary_search_iterative([0,1,2,3,4,5,6,7,8,9,10,11], 0) #0
p binary_search_iterative([0,1,2,3,4,5,6,7,8,9,10,11], 11) #11
p binary_search_iterative([0], 1) #nil