class PostsTable < ActiveRecord::Migration #blog posts
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
    end
  end
end
