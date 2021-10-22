require 'rails_helper'
include PostsHelper

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do
#AAA Testing => Arrange, Act, Assert

  creator = User.new(email: 'test@example.com', password: 'password', password_confirmation: 'password')

  #Arranging our data => Assigning variables
  @post = Post.new(title: 'My String', body: 'My text', views: 1)

  #Act => we're acting with our variables
  returned_post = assign_post_creator(@post, creator)

  #Assert => Assert that our expected outcome matches the actual outcome
  expect(returned_post.user).to be(creator)
end
