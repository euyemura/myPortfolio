class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular, :rails], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    render body: nil
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def rails
    @rails_portfolio_items = Portfolio.rails_magic
  end

  def new
    @portfolio_item = Portfolio.new
    # remember this is the part where we are instantiating the portfolio form, so check this out.
    # but now we need to make sure there is a spot for these, or that tecnologies_attributes are whitelisted in order to allow you to build a technology.
  end

  def show
  end

  # so i got confused, i thought that we were sending this portfolio item to the index.html.erb page and specifically to be the parameter of the link_to method, however, thats not true, the index link_to method is simply using routes as well as the specific id of the portfolio item thats being mapped over to send the user to the right url, however, when the user gets to that url, we have to show him the correct portfolio, this is why, with the link_to, you put in a parameter of the id of the portfolio item, this puts it inside of the params of the url, so now rails has the specific portfolio, which it finds by saying Portfolio.find(params[:id]) and then sending it to the actual show page. cool stuff right?

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item created! =)' }
        # format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        # format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully updated.' }
        # format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # need to add more comments, this passes a portfolio item to the method, that item is targeted to be destroyed.  usually, it isn't defined in the method, but in a private method that is set in the before action, this is to make sure we arent typing the same code over and over again.
    @portfolio_item.destroy
    # And then we are actually going to redirect the page, only after destroy occurs, so it responds to it being destroyed.
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully deleted.' }
      # format.json { head :no_content }
    end
  end

private
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      :git_link,
                                      :live_link,
                                      technologies_attributes: [:id, :name, :_destroy]
                                    )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

end
