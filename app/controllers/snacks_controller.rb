class SnacksController < ApplicationController
  def show
    binding.pry
    Snack.find()
  end
end
