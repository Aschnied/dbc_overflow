class AddDefaultsToVoting < ActiveRecord::Migration
  def change
    change_column :questions, :upvote, :integer, :default => 0
    change_column :questions, :downvote, :integer, :default => 0
    change_column :answers, :upvote, :integer, :default => 0
    change_column :answers, :downvote, :integer, :default => 0
  end
end
