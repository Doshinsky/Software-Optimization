def palindrome(string)
	if string == string.reverse
		answer = 'Yup.'
	else
		answer = 'Nope.'
	end
end

puts("Enter your word:")
string = gets.downcase.chomp!
exit if string.nil?
puts "-Is it a palindrome?\n-" + palindrome(string)