class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :project_name, :products, :total_items
  
  def products
  	object.products
  end

  def total_items
  	object.products.count
  end

end
