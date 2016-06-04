def stock_picker(stocks_prices)
	day = 0 
	max = 0
	buy = 0
	sell = 0
	days = stocks_prices.length
	bought_stocks = [0]
	future_stocks = [0]
	while(day < days)
		i = day
		j = day + 1
		while(i <= day)
			bought_stocks[i] = stocks_prices[i]
			i += 1
		end
		while(j < days)
			future_stocks[j-day] = stocks_prices[j]
			j += 1
		end
		bought_stocks.each do |bought|
			future_stocks.each do |future|
				if (max < (future - bought))
					max = future - bought
					buy = stocks_prices.index(bought)
					sell = stocks_prices.index(future)
				end
			end
		end
		day += 1
	end
	puts "[" + buy.to_s + "," + sell.to_s + "]"
end

list = [17,3,6,9,15,8,6,1,10]
stock_picker(list)