class ChangeUsersNameDefaultnull < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :name, :string, null: false, default: ""
  end
  def down
    change_column :users, :name, :string, null: false, default: "honda"
  end
end
