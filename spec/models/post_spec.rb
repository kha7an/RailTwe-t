require 'rails_helper'

RSpec.describe Post, type: :model do
  it "valid post with content" do
    user = User.create(username: "Ayaz", email: "1212@213.er", password: "123456", name: "ayaz", surname: "khasanov")
    post = Post.new(content: "test",user_id: user.id)
    expect(post).to be_valid

  end

  it "invalid post with content" do
    post = Post.new(content: "")
    expect(post).to_not be_valid
  end


end