class MasterMind
	def initialize
		puts "A new game created!"
		puts "Guess the code which" 
		puts "includes numbers from 1 to 6"
		puts "in 12 turns, OR LOSE!"
		puts "Use play to start the game."
	end

	private

	def set
		@code = []
		4.times {@code << (1+Random.rand(6)).to_s}
		@code = @code.join
		@input = 0
		@turn = 0
	end

	public

	def play
		set
		while ((@input != @code) && (@turn < 12))
			codeCheck
			displayStatus
		end
		if @input == @code
			"You won in #{@turn} turn(s)!"
		elsif @turn == 12
			"You LOSE, the code is #{@code}."
		end
	end

	def codeCheck
		puts "Enter the code: "
		@input = gets.chomp
		@input.split("").each do |num|
			unless ((num.to_i < 7) && (num.to_i > 0))
				puts "Make sure each number you entered is between 1 and 6."
				codeCheck
				return			
			end
		end
		@turn += 1
	end

    def displayStatus
    	@reply = []
    	input = @input.split("")
    	code = @code.split("")
    	for i in 0..3
    		if (input[i] == code[i]) && (@reply.length < 4)
    			@reply << "W" 
    			input[i] = "0"
    			code[i] = "7"
    		end
    	end
    	input.each_with_index do |num1,i1|
    		code.each_with_index do |num2,i2|
    			if num1 == num2 
    				if i1 != i2
    					if @reply.length < 4
    						@reply << "B" 
    						input[i1] = "0"
    						code[i2] = "7"
    					end
    				end
    			end
    		end
    	end
    	puts "#{@input} #{@reply.join} turns left:#{12 - @turn}"
    end
end
