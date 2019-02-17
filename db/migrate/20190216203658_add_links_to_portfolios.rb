class AddLinksToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :git_link, :string
    add_column :portfolios, :live_link, :string
  end
end
