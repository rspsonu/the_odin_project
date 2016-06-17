def bubble_sort(array)
	sort = 0
	index = 0
	length = array.length
	while sort != 1
		sort = 1
		index = 0
		array.each do |value|
			if index < length-1 
				if array[index] > array[index+1]
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

bubble_sort([4,3,78,2,0,2])