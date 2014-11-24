FactoryGirl.define do
	factory :user do
		email "user@example.com"
		password_digest "asdf;lkj"
		name "Test User"
	end
end