#!/usr/bin/env ruby

# Lets count some fucking beer bottles
# Counting beer with translated numbers

# Number translator method
def englishNumber number
  if number < 0
    return "Please enter a number that isn't negative."
  end
  if number == 0
    return 'zero'
  end

  numString = ''

  onesPlace = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

  tensPlace = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']

  teenagers = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

  left = number
  write = left / 1000000000000
	left = left - write * 1000000000000

	if write > 0
		trillions = englishNumber write
		numString = numString + trillions + " trillion"
		if left > 0
			numString = numString + " and "
		end
	end

  write = left / 1000000000
	left = left - write * 1000000000

	if write > 0
		billions = englishNumber write
		numString = numString + billions + " billion"
		if left > 0
			numString = numString + " and "
		end
	end

	write = left / 1000000
	left = left - write * 1000000

	if write > 0
		millions = englishNumber write
		numString = numString + millions + " million"
		if left > 0
			numString = numString + " and "
		end
	end

  write = left / 1000
  left = left - write * 1000

  if write > 0
    thousands = englishNumber write
    numString = numString + thousands + " thousand"
    if left > 0
      numString = numString + " and "
    end
  end

  write = left / 100
  left = left - write * 100

  if write > 0
    hundreds = englishNumber write
    numString = numString + hundreds + ' hundred'
    if left > 0
      numString = numString + ' and '
    end
  end

  write = left / 10
  left = left - write * 10

  if write > 0
    if ((write == 1) and (left > 0))
      numString = numString + teenagers[left-1]

    left = 0
    else
    numString = numString + tensPlace[write-1]
    end

    if left > 0
      numString = numString + '-'
    end
  end

write = left
left = 0

if write > 0
  numString = numString + onesPlace[write-1]
end

numString
end

puts 'Ready to count some beer bottles?'
usrin = gets.chomp
if usrin == 'yes'
  puts 'Alright lets do this!'
else
  puts 'Well too bad cause thats what this program does!'
end

puts "So how much beer do you have to count?"
beer = gets.chomp.to_i

# Beer counting method
# Make sure variables have been defined before the method is set.
def countBeer beer
  while (beer >= 0)
    puts
    puts englishNumber(beer) + ' bottles of beer on the wall,'
    puts englishNumber(beer) + ' bottles of beer,'
    beer = beer - 1
    puts 'knock one down, ' + englishNumber(beer) + ' bottles of beer on the wall!'
    sleep 0.5
  end
end

# Print out some beer song lyrics
puts countBeer(beer)
