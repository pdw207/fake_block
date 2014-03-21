require 'spec_helper'

describe User do
  user_attributes = { first_name: "Paco", last_name: "Grrrraa",
                         email: "info@example.com", user_type: "Launcher",
                         fun_fact: "The only launcher that does not go to class or speak any english."}

  let(:user){User.new(user_attributes)}

  it 'is invalid without a first name' do
    user.first_name = ""
    expect(user).to_not be_valid
    expect(user.errors[:first_name]).to be_present
  end

  it 'is invalid without a last name' do
    user.last_name = ""
    expect(user).to_not be_valid
    expect(user.errors[:last_name]).to be_present
  end

  it 'is invalid without an email' do
    user.email = ""
    expect(user).to_not be_valid
    expect(user.errors[:email]).to be_present
  end

  it 'has a unique email'
  it 'is valid if first name, last name & email are supplied'
  pending "Relations with other models"
  it 'has 1 post'
  it 'has 1 comment'
  it 'belongs to a group'
  it 'is an owner of a group'
end
