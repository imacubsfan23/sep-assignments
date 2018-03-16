def improving_complexity_version_one(*arrays)
    combined_array = arrays.map{|arr| arr}.flatten
    
    sorted_array = [combined_array.pop]
    
    combined_array.each do |val|
        sorted_array.length.times do |i|
            if val <= sorted_array[i]
                sorted_array.insert(i, val)
                break
            elsif i == sorted_array.length - 1
                sorted_array << val
                break
            end
        end
    end
    
    sorted_array
end

p improving_complexity_version_one([1,2,3,4,5,6,7],[3,4,2,3,4,5,1])