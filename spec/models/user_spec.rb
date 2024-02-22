require 'rails_helper'

RSpec.describe User, type: :model do
  it "valid with username,email,password,name,surname" do
    user = User.new(username: "Ayaz", email: "1212@213.er", password: "123456", name: "ayaz", surname: "khasanov")
    expect(user).to be_valid
  end

  it "not valid without name,surname" do
    user = User.new(username: "Ayaz", email: "1212@213.er", password: "123456")
    expect(user).to_not be_valid
  end

  it "is not valid with a duplicate email address" do
    User.create(username: "john", email: "1212@213.er", password: "123456", name: "ayaz", surname: "khasanov")
    user = User.new(username: "Ayaz", email: "1212@213.er", password: "123456", name: "ayaz", surname: "khasanov")
    expect(user).to_not be_valid
  end
end
