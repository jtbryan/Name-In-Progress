class TweetsController < ApplicationController
    def user_exists?(user)
        $client.user(user)
        true
    rescue # similar to Python's try/except
        false
    end

    def show
        @params = request.GET
        @pref = @params.values[0]
        if @pref == "hashtag"
            @tweet = @params.values[1]
            if @tweet.count('#') == 0
                @tweet = '#'+@tweet
            end
            # can modify as client.search("whatevertextiwanttomine", since: "2018-10-27", until: "2018-10-30") to get tweets from a date range
            @value = $client.search(@tweet)
        else
            @user = @params.values[1]
            if user_exists?(@user)
                @value = $client.user_timeline(@user, :count => 100)
            else
                @value = "Error"
            end
        end
    end 
end
