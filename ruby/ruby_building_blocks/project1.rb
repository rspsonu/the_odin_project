def caesar_cipher(text, num)
	letters = text.split("")
	i = 0
	letters.each do |letter|
		if (("a".."z") === letter || ("A".."Z") === letter)
			if ((letter.ord + num > 90) && (("A".."Z") === letter))
				letters[i] = (64 + ((letter.ord + num) - 90)).chr
			elsif ((letter.ord + num > 122) && (("a".."a") === letter))
				letters[i] = (96 + ((letter.ord + num) - 122)).chr
			else
				letters[i] = (letter.ord + num).chr
			end
		end
		i += 1
	end
	puts letters.join
end

puts "Enter the string to encrypt: "
text = gets.chomp
puts "Enter the index: "
index = (gets.chomp).to_i
caesar_cipher(text,index)
