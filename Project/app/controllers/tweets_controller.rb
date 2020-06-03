class TweetsController < ApplicationController
    def new
        @params = request.GET
        @pref = @params.values[0]
        @tweet = @params.values[1]
        if @pref == "hashtag"
            if @tweet.count('#') == 0
                @tweet = '#'+@tweet
            end
            @value = $client.search(@tweet, result_type: "recent")
        else
            @value = $client.search(@tweet, result_type: "recent")
        end
    end 
end
