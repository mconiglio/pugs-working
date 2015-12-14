class AddVenueToPost < ActiveRecord::Migration
  def change
    add_column :posts, :venue, :string
  end
end
