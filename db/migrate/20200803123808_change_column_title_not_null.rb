# frozen_string_literal: true

class ChangeColumnTitleNotNull < ActiveRecord::Migration[6.0]
  def up
    change_column :books, :title, :string, null: true
  end

  # 変更前の状態
  def down
    change_column :books, :title, :string, null: false
  end
end
