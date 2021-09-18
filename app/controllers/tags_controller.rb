# frozen_string_literal: true

# Tag for grouping articles
class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @path = request.filtered_path
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end
end
