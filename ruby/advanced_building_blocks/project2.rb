module Enumerable
	def my_each
		i = 0
		loop do
			break if i == self.length
			yield self[i]
			i += 1
		end
		return self
	end

	def my_each_with_index
		i = 0
		loop do
			break if i == self.length
			yield self[i],i
			i += 1
		end
		return self
	end

	def my_select
		i = 0
		array = []
		loop do 
			break if i == self.length
			if (yield(self[i]))
				array.push(self[i])
			end
			i += 1
		end
		return array
	end

	def my_all?
		i = 0
		loop do 
			break if i == self.length
			if block_given?
				unless (yield(self[i]))
					return false
				end
			else
				return false if !self[i]
			end 
			i += 1
		end
		return true
	end

	def my_any?
		i = 0
		loop do 
			break if i == self.length
			if block_given?
				if (yield(self[i]))
					return true
				end
			else
				return true if self[i]
			end
			i += 1
		end
		return false
	end

	def my_none?
		i = 0
		loop do 
			break if i == self.length
			if block_given?
				if (yield(self[i]))
					return false
				end
			else
				return false if self[i]
			end
			i += 1
		end
		return true
	end

	def my_count(*arg)
		i = 0
		count = 0
		loop do
			break if i == self.length
			if arg.empty?
				if block_given?
					if yield(self[i])
						count += 1
					end
					i += 1
				else
					i += 1
					count = i
				end
			else
				if self[i] == arg[0]
					count += 1
				end
				i += 1
			end
		end
		return count
	end

	def my_map
		i = 0
		array = []
		loop do
			break if i == self.to_a.length
			if block_given?
				array.push(yield(self.to_a[i]))
			else
				array = self.to_a
			end
			i += 1
		end
		return array
	end

	def my_inject(*arg)
		i = 0
		if arg.empty?
			arg = self.to_a[0]
			loop do 
				break if i == self.to_a.length-1
				arg = yield(arg,self.to_a[i+1])
				i += 1
			end
		else
			loop do 
				break if i == self.to_a.length
				arg[0] = yield(arg[0],self.to_a[i])
				i += 1
			end
		end
		return arg[0]	
	end

=begin
	def multiply_els(array)
		array.my_inject(1) {|prod,n| prod * n}
	end
=end
end