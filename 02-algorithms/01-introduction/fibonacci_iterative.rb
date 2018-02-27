def fib(n)
    return 0 if n == 0
    n0 = 0
    n1 = 1
    (n-1).times do
        temp = n0
        n0 = n1
        n1 = temp + n0
    end
    n1
end

10.times do |i|
  print "#{fib(i)}  "
end
puts ""
#0, 1, 1, 2, 3, 5, 8, 13, 21, 34