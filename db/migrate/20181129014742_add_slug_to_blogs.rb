class AddSlugToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :slug, :string
    add_index :blogs, :slug, unique: true
    # the index allows for each slug value to be unique, and thus you wont have any major issues when you are navigating a website.
  end
end
