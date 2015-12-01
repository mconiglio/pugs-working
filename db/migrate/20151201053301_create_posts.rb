class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string :attachment
      t.string :name
      t.text :content
      t.datetime :when
      t.references :user, index: true, foreign_key: true

      t.timestamps 
    end
  end
end
