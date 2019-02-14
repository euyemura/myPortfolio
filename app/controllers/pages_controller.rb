class PagesController < ApplicationController
  def home
    @posts = Blog.all
    # right here we are sending all of the blog posts over to our home page, incredible.
    # this blog data is available within any of these pages, we just have to call it, in other words, we have to make a database query.
    # we're essentially showing how to get data out of one controller, model, and view to another set of them, all within the same application which is pretty awesome.
  end

  def about
    @skills = Skill.all
  end

  def contact
  end

  def mindful_news
    @tweets = SocialTool.twitter_search
  end
end

# remember, we dont necessarily need any code here, because when the controlller method has the same name as the view, it'll automatically know that it needs to render the page of that same name as long as it is in a folder that has the same name as the name of the controller.
