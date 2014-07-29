require './lib/term'

def lookup
  print 'Enter word =>'
  search_result = Term.search(gets.chomp)
  if search_result == nil
    puts "Sorry, word not found. Try again"
    lookup
  else
    search_result
  end
end

def edit_entry
  search_result = lookup
  puts "Enter new definition"
  search_result.edit_definition(gets.chomp)
end

def add_entry
  puts "Enter the word"
  word = gets.chomp.downcase
  puts "Enter the definition"
  definition = gets.chomp.downcase
  Term.new(word, definition)
  puts "Would you like to add another entry? y/n"
  gets.chomp == "y"? add_entry : main_menu
end
#
puts "Moof and Justin's Dictionary!"
#menu: view all entries, add a new entry, edit an entry, remove an entry, lookup a word
def main_menu
  puts "To view all words, press 1"
  puts "To look up a word, press 2"
  puts "To add a new entry, press 3"
  puts "To edit an entry, press 4"
  puts "To remove an entry, press 5"
  puts "To exit, press 6"
  response = gets.chomp.to_i
  case response
  when 1
    Term.dictionary.each {|term| puts term.word}
  when 2
    search_result = lookup
    puts "*" * 80 + "\n\t" + search_result.word + ": " + search_result.definition + "\n" + "*" * 80 + "\n"
  when 3
    add_entry
  when 4
    edit_entry
  when 5
    search_result = lookup
    search_result.delete
  when 6
    return false
  else
    puts "Invalid option!"
  end
  true
end



Term.new("hi", "common greeting")
Term.new("bye", "what to say when you leave")

while main_menu
end

