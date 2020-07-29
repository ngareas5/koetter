class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :part
      t.numeric :thickness
      t.string :width
      t.numeric :length
      t.string :metric
      t.string :customer_id
      t.string :customer
      t.string :manufacturer
      t.string :categories  
      t.string :other_category
      t.string :product_use
      t.string :picture_link
      t.integer :degree
      t.string :item_class
      t.string :custom_species
      t.string :stock_species
      t.string :architectural_style
      t.string :search_words
      t.string :archedknives
      t.string :bentwoodknives
      t.string :carbideknives
      t.string :drawer
      t.string :dwg_revised
      t.string :steelknives
      t.string :knives
      t.string :uom
      t.string :item
      t.string :category1id
      t.string :category2id
      t.string :sort_by_store
      t.string :sort_by_likes
      t.string :flatbend
      t.string :verified
      t.string :published
      t.string :revised

      t.references :user
      #t.timestamps
    end
  end
end

