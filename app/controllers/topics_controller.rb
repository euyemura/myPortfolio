class TopicsController < ApplicationController
layout "blog"
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @blogs = @topic.blogs.published_blogs current_user, params
  end

  def topic_params
    params.require(:portfolio).permit(:title)
  end
end
