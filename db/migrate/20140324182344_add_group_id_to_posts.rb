class AddGroupIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :interest_group_id, :integer
  end
end
