require 'spec_helper'
require 'rails_helper'

describe Product do
  #Arrange necessary preconditions and inputs
  let!(:product) { create(:product) }

	# Question 1
  it "must have a description" do

  	product.description = ""

  	expect(product).to_not be_valid
  end

  # Question 2
  it "must have a name" do
    
    product.name = ""

    # A an object fails the test if it doesn't have a name
    expect(product).to_not be_valid
  end

  # Question 3
  it "must have a price" do

  	product.price_in_cents = nil
  	expect(product).to_not be_valid
  end

  # Question 4
  it "must be an integer" do

  	expect(product.price_in_cents).to be_an(Integer)
  end

  # Question 5
  it "must have a formatted price" do

  	expect(product.formatted_price).not_to be_nil
  end

  # Question 6
  it "can have many reviews" do
  	3.times do
  		product.reviews << create(:review)
  	end

  	expect(product.reviews.count).to equal(3)
  end


end