def heap_sort(arr)
# heapify
    (1..arr.length - 1).each do |i|
        child = i
        while child > 0
            parent = (child - 1) / 2
            if arr[parent] < arr[child]
                temp = arr[parent]
                arr[parent] = arr[child]
                arr[child] = temp
                child = parent
            else
                break
            end
        end
    end

# sort
    i = arr.length - 1
    while i > 0
        temp = arr[0]
        arr[0] = arr[i]
        arr[i] = temp
        i -= 1
        
        parent = 0
        while parent * 2 < i
            child = parent * 2 + 1
            if child < i && arr[child] < arr[child + 1]
                child += 1
            end
            
            if arr[parent] < arr[child]
                temp = arr[child]
                arr[child] = arr[parent]
                arr[parent] = temp
                parent = child
            else
                break
            end
        end
    end
    arr
end