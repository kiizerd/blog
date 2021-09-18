# frozen_string_literal: true

class CommentsController < ApplicationController
  def make_fake_comment(id)
    comment_params = {
      author: Faker::Name.name_with_middle,
      body: Faker::Lorem.paragraph(sentence_count: 4, supplemental: true)
    }

    @article = Article.find(params[:id])
    @article.comments.create(comment_params)
  end

  def demo_action
    (params[:demo_count] || 1).times { make_fake_comment(params[:article_id]) }
    @article = Article.find(params[:id])
    redirect_to article_path(@article)
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
