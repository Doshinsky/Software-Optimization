def fibonacciRabbits(mounths)
  if mounths < 3
    1
  else
    fibonacciRabbits(mounths - 1) + fibonacciRabbits(mounths - 2)
  end
end

puts 'Input number of months: '
mounths = gets.chomp.to_i

puts 'Couples of rabbits: '
puts fibonacciRabbits(mounths)