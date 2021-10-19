require 'rails_helper'

RSpec.describe Post, type: :model do
  # creating a user for the validation tests
  current_user = User.first_or_create!(email: 'test@example.com', password: 'password', password_confirmation: 'password')

  # validation tests
  it 'cannot have an empty title' do
    post = Post.new(
      title: '',
      body: 'A valid body',
      views: 0,
      user: current_user
    )
    expect(post).to_not be_valid

    post.title = 'A valid title'
    expect(post).to be_valid
  end

  it 'has a title at least two characters' do
    post = Post.new(
      title: 'I',
      body: 'A valid body',
      views: 0,
      user: current_user
    )
    expect(post).to_not be_valid

    post.title = 'A valid title'
    expect(post).to be_valid
  end

  it 'cannot have an empty body' do
    post = Post.new(
      title: 'A valid title',
      body: '',
      views: 0,
      user: current_user
    )
    expect(post).to_not be_valid

    post.body = 'A valid body'
    expect(post).to be_valid
  end

  it 'has a body at least 5 characters long' do
    post = Post.new(
      title: 'A valid title',
      body: 'Body',
      views: 0,
      user: current_user
    )
    expect(post).to_not be_valid

    post.body = 'A valid body'
    expect(post).to be_valid
  end

  it 'has a body at most 100 characters long' do
    post = Post.new(
      title: 'A valid title',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      views: 0,
      user: current_user
    )
    expect(post).to_not be_valid

    post.body = 'A valid body'
    expect(post).to be_valid
  end

  it 'has numerical views' do
    post = Post.new(
      title: 'A valid title',
      body: 'A valid body',
      views: 0,
      user: current_user
    )
    expect(post.views).to be_a(Integer)
  end
end
