# frozen_string_literal: true

# Main Blog data
class ArticlesController < ApplicationController
  def make_fake_article
    params = {
      title: "#{Faker::Verb.past} #{Faker::App.name}".titleize,
      body: (Faker::Lorem.paragraph(sentence_count: 30).split +
             Faker::Lorem.questions(number: 4).split)
             .join(' ')
    }

    Article.new(params).save
  end

  def demo_action
    (params[:demo_count] || 1).times { make_fake_article }
    redirect_to root_path
  end

  def index
    @articles = Article.all
    @path = request.filtered_path
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
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end
end
