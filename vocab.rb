require 'rubygems'
require 'wordnik-ruby'

wordnik=Wordnik::Wordnik.new({:api_key=>'api key'})

puts "Give me a word:"
word_input = gets.chomp

my_word = Wordnik::Word.find(word_input)

my_word_def = my_word.definitions

i = 0

word_definitions = Array.new

while i < my_word_def.length
   word_definitions.push(my_word_def[i].text)
   i += 1
end

counter = 1

for i in word_definitions
  puts counter.to_s + ": " + i
  counter += 1
end

puts "What definition do you want to save?"
definition_number = gets.chomp

definition_number = definition_number.to_i - 1

puts word_input + "\n" + word_definitions[definition_number]


open('vocab.txt', 'a') {|f|
  f.puts "\n" + word_input + "\n" + word_definitions[definition_number] 
}
