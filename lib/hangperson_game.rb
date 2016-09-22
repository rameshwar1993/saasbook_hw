class HangpersonGame

  attr_accessor :word, :guesses, :wrong_guesses
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def guess(letter)
    
    if letter == nil or letter == "" or !letter.match(/[A-Za-z]/)
      throw "Error"
    end
    
    if  @guesses.downcase.include? letter.downcase or  @wrong_guesses.downcase.include? letter.downcase
      return false
    end
    
    if @word.downcase.include? letter.downcase
        @guesses += letter
    else
        @wrong_guesses += letter
    end
  end
  
#  def word_with_guesses
#    self.word_with_guesses(@word, @guesses)
#  end
  
  def word_with_guesses(word=@word, guesses=@guesses)
    word.gsub(/[^ #{guesses}]/, '-')
#    wwg = @word;
#    
#    @word.downcase.split("").each do |i|
#      if not @guesses.downcase.include? i
#        wwg.sub!(i, "-")
#      end
#    end
#    
#    return wwg
  end
  
  def check_win_or_lose
    
    if @wrong_guesses.length == 7
      return :lose
    end
    
    if not word_with_guesses.include? "-"
      return :win
    end 
    
    return :play
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
