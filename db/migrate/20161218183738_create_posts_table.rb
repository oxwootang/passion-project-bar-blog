class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.text :location, null: false
      t.date :date_of_visit
      t.time :time_of_visit
      t.text :body, null: false
      t.references :user

      t.timestamps
    end
  end
end
