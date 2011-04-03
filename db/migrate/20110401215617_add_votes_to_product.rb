class AddVotesToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :votes, :integer, :default => 0
  end

  def self.down
    remove_column :products, :votes
  end
end
