class WordCountController < ApplicationController
  def word_count
    @text = params.fetch("user_text")
    @special_word = params.fetch("user_word")

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    @word_count = @text.split.count

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(" ","").length

  @times_in_sentence = 0 
   @text.split.each do |word|
     if word.gsub(/[^a-z0-9\s]/i, "").downcase == @special_word.downcase
       @times_in_sentence = @times_in_sentence + 1
     end
   end
   

    @occurrences = "your word appeared " + @times_in_sentence.to_s

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count_templates/word_count.html.erb")
  end

  def word_count_form
    render("word_count_templates/word_count_form.html.erb")
  end
end
