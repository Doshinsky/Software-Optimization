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
    if input_order == 'CK' or input_order == 'ck'
      @temperature + 273.15
    elsif input_order == 'CF' or input_order == 'cf'
      @temperature * 1.8 + 32
    elsif input_order == 'FC' or input_order == 'fc'
      (@temperature - 32) * 0.56
    elsif input_order == 'FK' or input_order == 'fk'
      (@temperature - 32) * 0.56 + 273.15
    elsif input_order == 'KF' or input_order == 'kf'
      1.8 * (@temperature - 273.15) + 32
    elsif input_order == 'KC' or input_order == 'kc'
      @temperature - 273.15
    end
  end
end

input = Temp_Converter.new
puts input.modifying