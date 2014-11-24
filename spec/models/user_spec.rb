require 'spec_helper'
require 'rails_helper'

describe User do
	let!(:user) { create(:user) }

	# Question 1
	it "can be created with a password and confirmation" do

  	user.password = nil && user.password_confirmation = nil

  	expect(User.new).to_not be_valid
  end

  #Question 2
  it "must have a password and confirmation on create" do

  	user.password = nil && user.password_confirmation = nil

  	expect(user).to_not be_valid

  end

  #Question 3
  it "a confirmation must match a password" do

  	user.password == user.password_confirmation

  	expect(user).to be_valid

  end

  #Question4
 #  it "email must be unique" do
		
	# user.email.to_not be_eq
	
	# end


end