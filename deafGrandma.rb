#!/usr/bin/env ruby

# Can you navigate a coversation with deaf grandma?
puts '*One day you find yourself at your grandmothers house, '
puts 'talking about nonsense because she is deaf.*'
puts 'What do you want to talk to grandma about now?'

# Variables defined
  usrin = gets.chomp
  byecnt = 0

# If BYE is typed you can attempt to leave
while (byecnt < 3)
  if (usrin == 'BYE')
    byecnt = bycnt + 1
    puts 'STAY AWHILE AND LISTEN!'
    puts
    usrin = gets.chomp
  else
# If BYE is not typed your talking to grandma
    while (usrin != 'BYE')
      if (usrin != usrin.upcase)
        puts 'HUH? SPEAK UP, YOU WHIPPERSNAPPER!'
        puts
        usrin = gets.chomp
      else
        puts 'NO, NOT SINCE ' + rand(1929..1951).to_s + '!'
        puts
        usrin = gets.chomp
      end
    end
  end
end
puts 'SEE YOU SOON, SONNY!'
