def fib(n)
    return n if n < 2
    fib(n-1) + fib(n-2)
end

20.times do |i|
  print "#{fib(i)}  "
end
puts ""