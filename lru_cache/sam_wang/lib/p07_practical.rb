require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  letter_cnt = Hash.new(0)
  string.each_char { |chr| letter_cnt[chr] += 1 }

  if string.length % 2 == 1
    letter_cnt.select { |_, v| v == 1 }.keys.length == 1 &&
    letter_cnt.select { |_, v| v == 2 }.keys.length == string.length / 2
  elsif string.length % 2 == 0
    letter_cnt.select { |_, v| v == 2 }.keys.length == string.length
  end
end
