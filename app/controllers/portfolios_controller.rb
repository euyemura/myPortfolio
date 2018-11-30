class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  # so i got confused, i thought that we were sending this portfolio item to the index.html.erb page and specifically to be the parameter of the link_to method, however, thats not true, the index link_to method is simply using routes as well as the specific id of the portfolio item thats being mapped over to send the user to the right url, however, when the user gets to that url, we have to show him the correct portfolio, this is why, with the link_to, you put in a parameter of the id of the portfolio item, this puts it inside of the params of the url, so now rails has the specific portfolio, which it finds by saying Portfolio.find(params[:id]) and then sending it to the actual show page. cool stuff right?

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

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
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
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
    @portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.destroy
    # And then we are actually going to redirect the page, only after destroy occurs, so it responds to it being destroyed.
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully deleted.' }
      # format.json { head :no_content }
    end
  end

end
