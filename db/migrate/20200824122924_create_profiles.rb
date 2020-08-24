class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name, null: false, default: ""
      t.string :zip_code
      t.string :address 
      t.text   :introduction
      t.timestamps
    end
  end
end
