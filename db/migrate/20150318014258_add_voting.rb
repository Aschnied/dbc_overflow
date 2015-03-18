class AddVoting < ActiveRecord::Migration
  def change
    add_column :questions, :upvote, :integer
    add_column :questions, :downvote, :integer
    add_column :answers, :upvote, :integer
    add_column :answers, :downvote, :integer
  end

end
