class AddPostStatusToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :status, :integer, default: 0
    # we added a default value to this column, which is cool, didn't know you could do that. this is the default stage, draft and publish.
  end
end
