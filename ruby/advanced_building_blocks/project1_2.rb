def bubble_sort_by(array)
	sort = 0
	index = 0
	length = array.length
	while sort != 1
		sort = 1
		index = 0
		array.each do |value|
			if index < length-1 
				if yield(array[index],array[index+1]) > 0
					array[index],array[index+1] = array[index+1],array[index]
					sort = 0
				end
				index += 1
			end
		end
		length -= 1
	end
	puts array.to_s
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
 	left.length - right.length
end