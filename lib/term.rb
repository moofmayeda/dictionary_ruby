class Term

  @@dictionary = []

  def Term.clear
    @@dictionary = []
  end

  def Term.dictionary
    @@dictionary
  end

  def Term.search(word)
    @@dictionary.each do |term|
      words_array = term.words.collect {|word| word.word}
      if words_array.include?(word)
        return term
      end
    end

    return nil
  end

  def initialize(word, definition)
    @words = [word]
    @definitions = [definition]

    @@dictionary << self
  end

  def words
    @words
  end

  def definitions
    @definitions
  end

  def add_word(new_word)
    @words << new_word
  end

  def add_definition(new_definition)
    @definitions << new_definition
  end

  def remove_definition(definition)
    @definitions.delete(definition)
  end

  def delete
    @@dictionary.delete(self)
    @words = []
    @definitions = []
  end

end
