class WordGuesserGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  def initialize(word)
    @word = word
    @guesses = ""
    @wrong_guesses = ""
  end

  def word()
    @word
  end

  def guesses()
    @guesses
  end

  def wrong_guesses()
    @wrong_guesses
  end

  def guess(c)
    if c.nil? || c.empty? || c.match?(/[[:alpha:]]/) == false
      raise ArgumentError
    end
    c = c.downcase
    if @word.include?(c)
      if guesses.include?(c) == false
        guesses << c 
        return true
      end
      else
        if wrong_guesses.include?(c) == false
          wrong_guesses << c
          return true
        end
    end
    return false
  end 

  def word_with_guesses()
    current = ""
    @word.each_char do |w|
      if @guesses.downcase.include?(w)
        current += w 
      else
        current += "-"
      end
    end
    return current
  end

  def check_win_or_lose()
    current = word_with_guesses
    if @wrong_guesses.length >= 7
      return :lose
    end
    if current.include?("-")
      return :play
    end
    return :win
  
  end

  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

end
