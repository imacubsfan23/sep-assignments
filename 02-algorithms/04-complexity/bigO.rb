=begin

    Write a Ruby method that takes a number n. 
    This method must print the worst-case number of 
    iterations for linear search to find an item in 
    collections of size one to n. Use it to generate 
    a table of worst-case iterations of collections 
    up to size 10.
    
=end

def bigO(n)
    puts("Size\tBig-O")
    (1..n).each do |size|
        puts "#{size}\t#{size}"
    end
end

bigO(10)