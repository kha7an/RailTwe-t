require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "DELETE #destroy" do
    it "delete post" do
      user = User.create(username: "Ayaz", email: "1212@213.er", password: "123456", name: "ayaz", surname: "khasanov")
      post = Post.create(content: "test",user_id: user.id)
      expect {
        delete :destroy, params: { id: post.id }
      }.to change(Post, :count).by(-1)
      expect(response).to redirect_to(root_path)
    end
  end
end

