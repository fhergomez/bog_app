class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
  end

  def show
    @tag = Tag.find params[:id]
  end

  def destroy
    Tag.find(params[:id]).delete
    redirect_to tags_path
  end
end
