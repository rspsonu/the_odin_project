def substrings(string,dictionary)
  string = string.downcase.split("")
  match = Hash.new
  dictionary.each do |word|
    i = 0
    num = 1
    j = word.length - 1
    while (j < string.length)
      if (string[i..j].join == word)
        match[word] = num
        num += 1
      end
      i += 1
      j += 1
    end
  end
  puts match
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?",dictionary)
