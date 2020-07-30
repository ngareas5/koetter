class Product < ApplicationRecord
	belongs_to :user 
	has_many :add_projects
	has_many :projects, through: :add_projects
end
