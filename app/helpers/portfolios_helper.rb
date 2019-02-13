module PortfoliosHelper
  def image_generator(width:, height:)
    "https://via.placeholder.com/#{width}x#{height}"
  end

  def portfolio_img img, type
    if img
      img
    elsif type == "thumb"
      image_generator(height: '200', width: '350')
    else
      image_generator(height: '400', width: '600')
    end
  end


end
