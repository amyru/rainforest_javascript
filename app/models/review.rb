class Review < ActiveRecord::Base
	validates :comment, presence: true # so that the user cannot create an empty review

	belongs_to :user
	belongs_to :product
end
