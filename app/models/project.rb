class Project < ApplicationRecord

	belongs_to :user
	has_many :add_projects
	has_many :products, through: :add_projects

end
