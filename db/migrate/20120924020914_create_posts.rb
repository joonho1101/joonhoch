class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
	  t.integer :author_id
      t.string :title
      t.string :content
      t.float :price
      t.string :location

      t.timestamps
    end
  end
end
