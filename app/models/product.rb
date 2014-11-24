class Product < ActiveRecord::Base
	validates :description, :name, :category, presence: true
	validates :price_in_cents, numericality: {only_integer: true}

	has_many :reviews
	has_many :users, through: :reviews

	scope :newest_first, -> {order("created_at DESC")}

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100
		sprintf("%.2f", price_in_dollars)
	end
end


