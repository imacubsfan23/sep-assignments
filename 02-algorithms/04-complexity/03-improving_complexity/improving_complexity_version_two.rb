def improving_complexity_version_two(*arrays)
    combined_array = arrays.map{|arr| arr}.flatten
    quick_sort( combined_array, 0, combined_array.length - 1 )
end

def quick_sort(arr, first, last)
    if first < last
        split_index = partition(arr, first, last)
        quick_sort(arr, first, split_index - 1)
        quick_sort(arr, split_index + 1, last)
    end
    arr
end

def partition(arr, first, last)
    pivot = arr[last]
    split_index = first
    
    i = first
    while i < last
        if pivot && arr[i] <= pivot
            temp = arr[i]
            arr[i] = arr[split_index]
            arr[split_index] = temp
            split_index += 1
        end
        i += 1
    end
    
    temp = arr[split_index]
    arr[split_index] = pivot
    arr[last] = temp
    split_index
end

p improving_complexity_version_two([1,2,3,4,5,6,7],[3,4,2,3,4,5,1])