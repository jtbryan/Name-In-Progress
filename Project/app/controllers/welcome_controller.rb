class WelcomeController < ApplicationController
  def index
    @value = $client
  end

  def new
  end
end
