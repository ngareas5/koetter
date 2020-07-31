class ResetQuantity < ActiveRecord::Migration[6.0]
  def up
    change_column :add_projects, :quantity, :integer, default: 1
  end

  def down
    change_column :add_projects, :quantity, :integer
  end
end
