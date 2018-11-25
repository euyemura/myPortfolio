class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :title
      t.integer :percent_utilized

      t.timestamps
    end
  end
end


# this is one of the only things that we created with this generator command, other than of cuorse the model in the app folder.  so this means that this is going to create a new table in our database.  That being said, we must now migrate our database. 
