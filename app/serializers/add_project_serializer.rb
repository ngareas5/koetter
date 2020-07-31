class AddProjectSerializer < ActiveModel::Serializer
  attributes :id, :product, :quantity

  def product
  	object.product
  end

end
