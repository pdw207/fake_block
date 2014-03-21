class CreateUserInterestGroups < ActiveRecord::Migration
  def change
    create_table :user_interest_groups do |t|
      t.integer :interest_group_id, null: false
      t.integer :user_id, null: false
      t.string :user_type, null: false

      t.timestamps
    end

    add_index :user_interest_groups, :interest_group_id
    add_index :user_interest_groups, :user_id
  end
end
