class Term

  @@dictionary = []

  def Term.clear
    @@dictionary = []
  end

  def initialize(word, definition)
    @definition = definition
    @word = word
    @@dictionary << self
  end

  def word
    @word
  end

  def definition
    @definition
  end

  def Term.dictionary
    @@dictionary
  end

  def Term.search(word)
    @@dictionary.each do |dict_word|
      if word.upcase == dict_word.word.upcase
        return dict_word
      end
    end
    return nil
  end

  def edit_definition(new_definition)
    @definition = new_definition
  end

  def delete
    @@dictionary.delete(self)
    @word = ""
    @definition = ""
  end

end
