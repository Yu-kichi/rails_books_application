class AddProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false, default: "honda" # あとでdefaultは消す。
    add_column :users, :zip_code, :string
    add_column :users, :address, :text
    add_column :users, :introduction, :text
  end
end
