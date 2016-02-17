class Product < ActiveRecord::Base
	belongs_to :category
	has_many :comments

	def self.display_product(id)
		self.find(id)
		# Product.update(3, category_id:3) -used to hardcode category id in console
	end

	def self.update_product(id, name, description, pricing)
		self.find(id).update(name:name, description:description, pricing:pricing)
	end

	def self.destroy_product(id)
		self.destroy(id)
	end
end
 