module DefaultPageContent

  extend ActiveSupport::Concern
  # ^^ this is a module in and of itself.
  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Eric Akio Uyemura | Portfolio"
    @seo_keywords = "Eric Uyemura portfolio"
  end

end
