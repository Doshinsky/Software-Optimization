class Temp_Converter
  def initialize()
    puts 'Temperature:'
    @temperature = gets.chomp.to_f
    puts 'Scale:'
    @initial = gets.chomp
    puts 'New scale:'
    @final = gets.chomp
  end

  def modifying()
    input_order = @initial + @final
    if input_order.downcase == 'ck'
      @temperature + 273.15
    elsif input_order.downcase == 'cf'
      @temperature * 1.8 + 32
    elsif input_order.downcase == 'fc'
      (@temperature - 32) * 0.56
    elsif input_order.downcase == 'fk'
      (@temperature - 32) * 0.56 + 273.15
    elsif input_order.downcase == 'kf'
      1.8 * (@temperature - 273.15) + 32
    elsif input_order.downcase == 'kc'
      @temperature - 273.15
    end
  end
end

input = Temp_Converter.new
puts input.modifying