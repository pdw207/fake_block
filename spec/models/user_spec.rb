require 'spec_helper'

describe User do
  user_attributes = { first_name: "Paco", last_name: "Grrrraa",
                         email: "info@example.com", user_type: "Launcher",
                         fun_fact: "The only launcher that does not go to class or speak any english."}

  let!(:user){User.create(user_attributes)}

  let!(:hello_world) {Post.create!(title: "My First Program!!", body:"puts 'hello world'", author: user)}

  let(:user2) {User.new(user_attributes)}

  let!(:hi_comment) { Comment.create(post: hello_world, commenter: user, body: "BUY VI@GR@") }

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

  it 'has a unique email' do
    user2.first_name = "Paca"
    expect(user2).to_not be_valid
    expect(user2.errors[:email]).to be_present
  end


  it 'is valid if first name, last name & email are supplied' do
    expect(user).to be_valid
    expect(user.errors).to be_empty

  end

  it 'lists groups the user belongs to' do
    interest_group = InterestGroup.create!(name: 'Family Tree')
    other_interests = InterestGroup.create!(name: 'Latin Dancing')
    even_other_interests = InterestGroup.create!(name: ' Hair Club for Men and Women')
    user.user_interest_groups.create!(interest_group: interest_group, user_type: 'member')
    user.user_interest_groups.create!(interest_group: other_interests, user_type: 'member')
    user.user_interest_groups.create!(interest_group: even_other_interests, user_type: 'owner')
    expect(user.interest_groups.count).to eq(3)
  end

  it 'has 1 post' do
    expect(user.posts.count).to eq(1)
  end

  it 'has 1 comment' do
    expect(user.comments.count).to eq(1)
  end
end
