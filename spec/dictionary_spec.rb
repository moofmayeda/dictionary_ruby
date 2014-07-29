require 'rspec'
require 'term'
require 'definition'
require 'word'

describe 'Term' do
  before do
    Term.clear
  end
  describe "initialize" do
    it 'is initialized with a word and a definition' do
      test_term = Term.new(Word.new("apple", "english"), Definition.new("red fruit", "english"))
      test_term.should be_an_instance_of Term
    end
  end
  describe "definition" do
    it 'displays the definition' do
      test_definition = Definition.new("juicy crunchy fruit from a tree","english")
      test_term = Term.new(Word.new("apple","english"), test_definition)
      test_term.definitions.should eq [test_definition]
    end
  end
  describe "remove_definition" do
    it 'removes a definition of a particular word' do
      test_definition = Definition.new("juicy crunchy fruit from a tree","english")
      test_term = Term.new(Word.new("apple", "english"), test_definition)
      test_term.remove_definition(test_definition)
      test_term.definitions.should eq []
    end
  end
  describe "delete" do
    it 'deletes an entry in the dictionary' do
      test_term = Term.new(Word.new("apple", "english"), Definition.new("red fruit", "english"))
      test_term.delete
      Term.dictionary.should eq []
      test_term.words.should eq []
      test_term.definitions.should eq []
    end
  end
  describe ".clear" do
    it "deletes all the dictionary entries" do
      test_term = Term.new(Word.new("apple", "english"), Definition.new("red fruit", "english"))
      Term.clear
      Term.dictionary.should eq []
    end
  end
  describe ".search" do
    it "searches for & returns a Term object given a word object" do
      test_word = Word.new("apple", "english")
      test_term = Term.new(test_word, Definition.new("red fruit", "english"))
      Term.search('apple').should eq test_term
    end
  end
  describe "add_definition" do
    it "adds one or more extra definitions to a word" do
      original_definition = Definition.new("red fruit", "english")
      test_term = Term.new(Word.new("apple", "english"), original_definition)
      test_definition = Definition.new("crunchy thing from tree", "english")
      test_term.add_definition(test_definition)
      test_term.definitions.should eq [original_definition,test_definition]
    end
  end
  describe "add_word" do
    it "adds another word to an entry, to support multiple languages" do
      word1 = Word.new("apple", "english")
      word2 = Word.new("appleay", "piglatin")
      test_term = Term.new(word1, Definition.new("Red Fruit", "english"))
      test_term.add_word(word2)
      test_term.words.should eq([word1, word2])
    end
  end
end

describe "Definition" do
  describe "initialize" do
    it "initializes a definition with a definition and language" do
      test_definition = Definition.new("fruta roja", "spanish")
      test_definition.should be_an_instance_of Definition
    end
  end
  describe "definition" do
    it "displays the definition" do
      Definition.new("red fruit", "english").definition.should eq "red fruit"
    end
  end
  describe "language" do
    it "displays the language" do
      Definition.new("red fruit", "english").language.should eq "english"
    end
  end
  describe "edit" do
    it "edit the definition and/or language" do
      test_definition = Definition.new("fruta roja", "spanish")
      test_definition.edit("fruit roja from un arbol", "spanglish")
      test_definition.definition.should eq "fruit roja from un arbol"
      test_definition.language.should eq "spanglish"
    end
  end
end

describe "Word" do
  describe "initialize" do
    it "initializes a word with a word and a language" do
      Word.new("roja", "spanish").should be_an_instance_of Word
    end
  end
  describe "word" do
    it "displays the word" do
      Word.new("fruit", "english").word.should eq "fruit"
    end
  end
  describe "language" do
    it "displays the language" do
      Word.new("fruit", "english").language.should eq "english"
    end
  end
end
