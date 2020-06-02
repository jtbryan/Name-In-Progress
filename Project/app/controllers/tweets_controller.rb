class TweetsController < ApplicationController
    def index
        @value = $client.search("#Floyd")
    end 
end
