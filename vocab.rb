require 'rubygems'
require 'wordnik-ruby'

wordnik=Wordnik::Wordnik.new({:api_key=>'api_key'})

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

open('vocab.txt', 'a') {|f|
  f.puts "\n" + word_input + "\n" + "Definition: " + word_definitions[definition_number] 
}

puts "Would you like examples? (y/n)"
want_examples = gets.chomp

my_word_ex = my_word.examples

i = 0

word_examples = Array.new

while i < my_word_ex.length
   word_examples.push(my_word_ex[i].display)
   i += 1
end

counter = 1

for i in word_examples
  puts counter.to_s + ": " + i
  counter += 1
end

puts "What example do you want to save?"
example_number = gets.chomp

example_number = example_number.to_i - 1


open('vocab.txt', 'a') {|f|
  f.puts "Example: " + word_examples[example_number] 
}