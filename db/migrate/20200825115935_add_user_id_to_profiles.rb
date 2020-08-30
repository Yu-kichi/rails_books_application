class AddUserIdToProfiles < ActiveRecord::Migration[6.0]
  def up
    add_reference :profiles, :user, null: false, index: true
  end
  def down
    remove_reference :profiles, :user, index: true
  end
end
