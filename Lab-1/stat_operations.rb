require 'csv'

class StatOperations
  def initialize(input_file, data_line)
    @data = CSV.read(input_file)[data_line - 1].collect {|i| i.to_f}
    puts 'Choose operation to be done:
      a). Max,
      b). Min,
      c). Avg,
      d). CSV.'
    choice = gets.chomp
    puts operation(choice)
  end

  def operation(option)
    @avg = (@data.max + @data.min) / 2.0
    if option.downcase == 'a' or option == '1' or option == 'max'
      @data.max
    elsif option.downcase == 'b' or option == '2' or option == 'min'
      @data.min
    elsif option.downcase == 'c' or option == '3' or option == 'avg'
      @avg
    elsif option.downcase == 'd' or option == '4' or option == 'csv'
      sum = 0.0
      @data.each do |i|
        sum += (i - @avg) * 2
      end
      sum / (@data.length - 1)
    end
  end

  def handler
    begin
      puts 'Keep going? (option/N)?'
      choice = gets.chomp
      puts operation(choice)
    end while choice.downcase != 'n' && choice.downcase != 'q'
  end
end

path = './data.csv'
stream = StatOperations.new(path, 2)
puts stream.handler