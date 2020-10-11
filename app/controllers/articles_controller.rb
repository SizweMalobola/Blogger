class ArticlesController < ApplicationController
    include ArticlesHelper

    def index
        @articles = Article.all 
    end

    def show
        @article = Article.find(params[:id])
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new(article_params)
        if @article.save
            flash.notice = "Article #'#{@article.id}' Created!"

            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            flash.notice = "Article #'#{@article.id}' Updated!"

            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    def destroy
        @article = Article.find(params[:id])
        flash.notice = "Article #'#{@article.id}' Deleted!"
        @article.destroy
        redirect_to articles_path
    end
end
