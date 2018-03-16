def improving_complexity_version_three(*arrays)
    arrays.map{|arr| arr}.flatten.sort
end

p improving_complexity_version_three([1,2,3,4,5,6,7],[3,4,2,3,4,5,1])