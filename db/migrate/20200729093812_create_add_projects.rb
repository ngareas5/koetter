class CreateAddProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :add_projects do |t|
    	t.references :product, index: true, foreign_key: true
    	t.references :project, index: true, foreign_key: true
    	t.integer :quantity
      t.timestamps
    end
  end
end
