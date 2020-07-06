class CreateOrderHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :order_histories do |t|
      t.integer :order_id
      t.date :order_date
      t.string :status
      t.references :user
      t.references :product
      t.timestamps
    end
  end
end
