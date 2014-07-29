require 'rspec'
require 'term'

describe 'Term' do
  before do
    Term.clear
  end
  describe "initialize" do
    it 'is initialized with a word and a definition' do
      test_term = Term.new("apple", "juicy crunchy fruit from a tree")
      test_term.should be_an_instance_of Term
    end
  end
  describe "definition" do
    it 'displays the definition' do
      test_term = Term.new("apple", "juicy crunchy fruit from a tree")
      test_term.definition.should eq "juicy crunchy fruit from a tree"
    end
  end
  describe "edit_definition" do
    it 'edits the definition of a particular word' do
      test_term = Term.new("apple", "juicy crunchy fruit from a tree")
      test_term.edit_definition("sweet fruit from a tree")
      test_term.definition.should eq "sweet fruit from a tree"
    end
  end
  describe "delete" do
    it 'deletes an entry in the dictionary' do
      test_term = Term.new("apple", "juicy crunchy fruit from a tree")
      test_term.delete
      Term.dictionary.should eq []
    end
  end
  describe ".clear" do
    it "deletes all the dictionary entries" do
      test_term = Term.new("apple", "juicy crunchy fruit from a tree")
      Term.clear
      Term.dictionary.should eq []
    end
  end
  describe ".search" do
    it "searches for & returns a Term object given a word string" do
      test_term = Term.new("apple", "juicy crunchy blah blah blah")
      Term.search("apple").should eq test_term
    end
  end
end
