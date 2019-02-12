class TopicsController < ApplicationController
  before_action :set_sidebar_topics
  layout "blog"
  def index
    @topics = Topic.has_blogs
  end

  def show
    @topic = Topic.find(params[:id])
    @blogs = @topic.blogs.published_blogs current_user, params
  end

  def topic_params
    params.require(:portfolio).permit(:title)
  end

  private

  def set_sidebar_topics
    @side_bar_topics = Topic.has_blogs
  end

end
