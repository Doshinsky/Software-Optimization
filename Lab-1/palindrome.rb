def palindrome(string)
	if string == string.reverse
		answer = 'Yup.'
	else
		answer = 'Nope.'
	end
end

puts("Enter your word:")
string = gets
exit if string.nil?
string.chomp!
puts "-Is it a palindrome?\n-" + palindrome(string)