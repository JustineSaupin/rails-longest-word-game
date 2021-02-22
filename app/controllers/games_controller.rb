require 'open-uri'
class GamesController < ApplicationController

  def new
    # display random grid
    @grid = ("A".."Z").to_a.shuffle.first(10)
    # display a form => view
  end

  def score
    # form submitted
    @answer = params[:answer]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    serialized_word = URI.open(url).read
    word_dico = JSON.parse(serialized_word)

    if word_dico['found'] && # letters corresponding?
      @message = 'winner'
    else
      @message = 'loser'
    end
  end
end
