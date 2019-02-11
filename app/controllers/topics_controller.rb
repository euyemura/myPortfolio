class TopicsController < ApplicationController
layout "blog"
  def index
    @topics = Topic.all
  end

  def show
    @topics = Topic.find(params[:id]).blogs
  end

  def topic_params
    params.require(:portfolio).permit(:title)
  end
end
