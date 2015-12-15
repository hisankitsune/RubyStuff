#!/usr/bin/env ruby

# 1 Billion seconds old

puts "When do you turn 1 Billion seconds old?"
puts "Just enter your birthday!"
puts
puts "What year were you born?"
  year = gets.chomp.to_i
puts "What month were you born?"
  month = gets.chomp.to_i
puts "What day were you born?"
  day = gets.chomp.to_i
puts "Do you know what hour you were born (estimate if you need)?"
  hour = gets.chomp.to_i
puts

# Huge mess to figure out the date
birthday = Time.mktime(year, month, day, hour)
timeNow = Time.new # The time this program ran down to the seconds
howOld = timeNow - birthday
  howOld = howOld.round(0)
tilBill = 1000000000 - howOld
days = tilBill / 86400
years = days / 365
  remDays = days % 365
billDay = timeNow + tilBill
date = billDay.strftime("%m/%d/%Y")

# Allows printing of english numbers
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

# Outputs the date for when you will be 1 Bilion seconds old
puts "*************************************************************"
  if howOld < 1000000000
    puts " " + date + " is the day you will be 1 Billion seconds old,"
    puts " only #{englishNumber(years)} years and #{englishNumber(remDays)} days"
    puts " left before you are 1 Billion seconds old!"
  else
    puts " " + date + " is the day you were be 1 Billion seconds old!"
  end
puts "*************************************************************"
