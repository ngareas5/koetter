class AddProjectSerializer < ActiveModel::Serializer
  attributes :id, :product

  def product
  	object.product
  end

end
