class AddDobToUser < ActiveRecord::Migration
  def change
    add_column :users, :dob, :date
    add_column :users, :sex, :string, :default =>"male", :null => false
  end
end
