class AddprojectToproduct < ActiveRecord::Migration[6.0]
  def change
  	add_reference :products, :project, index: true
  end
end
