class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:portfolio).permit(:title)
  end
end
