require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:word].upcase
    @grid = params[:grid].split
    @word_letters = @word.split('')
    @check_letter = true
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    dictionary_serialised = URI.open(url).read
    dictionary = JSON.parse(dictionary_serialised)

    @word_letters.each do |letter|
      if !(@grid.include?(letter))
        @check_letter = false
        return @result = "Sorry but #{@word} can't be built out of #{grid}"
      end
    end

    if dictionary["found"]
  end
end
