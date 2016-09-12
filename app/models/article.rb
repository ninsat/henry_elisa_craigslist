class Article < ApplicationRecord
	belongs_to :user
	belongs_to :category
	
	validates :title, :description, :price, :condition, :location, :category_id, :user_id, presence: true
	validates :description, uniqueness: true
	validates :title, :description, length: { minimum: 3 }
end
