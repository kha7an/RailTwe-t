require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "valid comment" do
    user = User.create(name: "John", email: "john@example.com")
    post = Post.create(content: "TEst", user_id: user)
    comment = Comment.new(body: "Test",post: post, user: user)
    expect(comment).to be_valid
  end

  it "invalid comment" do
    user = User.create(name: "John", email: "john@example.com")
    post = Post.create(content: "TEst", user_id: user)
    comment = Comment.new(body: "",post: post, user: user)
    expect(comment).to_not be_valid
  end
end