class Definition

  def initialize(definition, language)
    @definition = definition
    @language = language
  end

  def definition
    @definition
  end

  def language
    @language
  end

  def edit(definition, language)
    @definition = definition
    @language = language
  end
end
