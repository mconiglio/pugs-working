class AddCachedVotesUpToPosts < ActiveRecord::Migration

  def self.up

    add_column :posts, :cached_votes_up, :integer, :null => false, :default => 0

  end

  def self.down

    remove_column :posts, :cached_votes_up

  end

end
