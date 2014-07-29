require './lib/term'
require './lib/definition'
require './lib/word'

def prompt(string)
  print string + " =>"
  gets.chomp
end

def display_word(term)
  puts "*" * 80 + "\n\t"
  term.words.each {|word| puts "\t" + word.word}
  term.definitions.each {|definition| puts "\t\t" + definition.definition}
  puts "\n" + "*" * 80 + "\n"
end


def lookup
  search_result = Term.search(prompt("Enter Word"))

  if search_result == nil
    puts "Sorry, word not found. Try again"
    lookup
  else
    search_result
  end
end

def edit_entry
  search_result = lookup
  search_result.definitions.each_index {|index| puts "#{index + 1} - " + search_result.definitions[index].definition}
  selected_definition = search_result.definitions[prompt("Enter the number of the definition you'd like to edit").to_i-1]
  new_definition = prompt("Enter the new definition")
  new_language = prompt("Enter the language")
  selected_definition.edit(new_definition, new_language)
end

def add_entry
  word = prompt("Enter Word").downcase
  definition = prompt("Enter definition").downcase
  language = prompt("Enter language").downcase
  Term.new(Word.new(word, language), Definition.new(definition, language))
  prompt("Would you like to add another entry? (y/n)") == "y" ? add_entry : main_menu
end

puts "Moof and Justin's Dictionary!"
#menu: view all entries, add a new entry, edit an entry, remove an entry, lookup a word
def main_menu
  puts "To view all words, press 1"
  puts "To look up a word, press 2"
  puts "To add a new word, press 3"
  puts "To create an additional definition, press 4"
  puts "To edit a definition, press 5"
  puts "To remove a word, press 6"
  puts "To add another word to an existing entry, press 7"
  puts "To exit, press 0"
  response = prompt("").to_i
  case response
  when 1
    Term.dictionary.each do |term|
      term.words.each {|word| puts word.word}
    end
  when 2
    display_word(lookup)
  when 3
    add_entry
  when 4
    search_result = lookup
    definition = prompt("Enter a new definition")
    language = prompt("Enter the language")
    search_result.add_definition(Definition.new(definition, language))
  when 5
    edit_entry
  when 6
    lookup.delete
  when 7
    search_result = lookup
    new_word = prompt("Enter the additional word")
    new_language = prompt("Enter the language")
    search_result.add_word(Word.new(new_word, new_language))
  when 0
    return false
  else
    puts "Invalid option!"
  end
  true
end

while main_menu
end

