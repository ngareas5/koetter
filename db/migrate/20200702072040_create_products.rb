class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :model_number
      t.string :category
      t.string :dimensions
      t.string :style
      t.string :material
      t.string :other
      t.references :user

      t.timestamps
    end
  end
end
