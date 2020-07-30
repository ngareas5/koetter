class ProductSerializer < ActiveModel::Serializer
  attributes :id, :part, :width, :length, :thickness
end
