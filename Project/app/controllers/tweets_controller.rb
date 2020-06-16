class TweetsController < ApplicationController
    def user_exists?(user)
        $client.user(user)
        true
    rescue # similar to Python's try/except
        false
    end

    def create
        @logged_user = User.find(session[:user_id2])
        @tweet = @logged_user.tweets.create(tweet_params)
        session[:return_to] ||= request.referer
        redirect_to session.delete(:return_to)
    end

    def destroy
        @logged_user = User.find(session[:user_id2])
        @tweet = @logged_user.tweets.find(params[:id])
        @tweet.destroy
        session[:return_to] ||= request.referer
        redirect_to session.delete(:return_to)
    end 

    def show
        if session[:user_id2] != nil
            @logged_user = User.find(session[:user_id2])
        end 
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

    private
    def tweet_params
      params.require(:tweet).permit(:name, :title, :favorites, :retweets)
    end 
end
