class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        #render plain: params[:article].inspect
        # takes a simple hash with a key of :plain value of params[:article].inspect
        # params contains the fields coming from the form, this method returns an ActionController::Parameters
        # Example URL: http://www.example.com/?username=dhh&email=dhh@email.com
        #   params[:username] = "dhh"
        #   params[:email] = "dhh@email.com"
        @article = Article.new(article_params)

        # saves the article to the database 
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    
    def destroy
        # find the article in the db
        @article = Article.find(params[:id])
        # delete the article
        @article.destroy
   
        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
