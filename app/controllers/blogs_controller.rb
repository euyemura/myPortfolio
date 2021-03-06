class BlogsController < ApplicationController
  before_action :set_sidebar_topics, except: [:update, :create, :destroy, :toggle_status]
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all


  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.published_blogs current_user, params
    @topics = Topic.all
    @page_title = "Blog | Eric Akio"
    @seo_keywords = "Eric Uyemura portfolio blog"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
      @page_title = "#{@blog.title} | Eric Akio"
      @seo_keywords = @blog.body
    else
      redirect_to blogs_path, notice: "This page is for admins only!"
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  def toggle_status
    (@blog.draft?) ? @blog.published! : @blog.draft!

    redirect_to blogs_url, notice: 'Post status was updated!'
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog created! =)' }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        # format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
      #say you had changed params[:id] to 1, then no matter wht you clicked on, it would always show 1.
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :topic_id, :status)
    end

    def set_sidebar_topics
      @side_bar_topics = Topic.has_blogs
    end
end
