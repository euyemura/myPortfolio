module SetSource
  extend ActiveSupport::Concern
  # ^^ this is a module in and of itself.
  included do
    before_action :set_source
  end

  def set_source
    session[:source] = params[:q] if params[:q]
  end
end
