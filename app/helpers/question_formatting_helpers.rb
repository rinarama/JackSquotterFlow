module EntryFormatting
  def stub(text)
    return text if less_than_16_words_long?(text)
    first_15_words(text) +  '...'
  end

  private
  def less_than_16_words_long?(text)
    !(text.match first_15_words_regex)
  end

  def first_15_words(text)
    text.slice first_15_words_regex
  end

  def first_15_words_regex
    /\A(\S+\s){15}/
  end
end

helpers EntryFormatting
