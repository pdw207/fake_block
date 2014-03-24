require 'spec_helper'

describe Post do
  context 'validations' do
    let(:author) { User.create(first_name: "Master", last_name: "Splinter", email: "splinter@rats.com")}
    let(:group) { InterestGroup.create(name: "Ninja") }
    let(:post) { Post.new(title: "LOOK AT ME", body: "ONE TIME I OWNED A TURTLE", author: author, interest_group: group) }

    it 'is valid if it it contains title, body, author & group' do
      expect(post).to be_valid
    end

    it 'is invalid without a title' do
      post.title = ""
      expect(post).to_not be_valid
      expect(post.errors[:title]).to be_present
    end

    it 'is invalid without a body' do
      post.body = ""
      expect(post).to_not be_valid
      expect(post.errors[:body]).to be_present
    end

    it 'is invalid without an author' do
      post.author = nil
      expect(post).to_not be_valid
      expect(post.errors[:author]).to be_present
    end

    it 'belongs to an interest group' do
      expect(post.interest_group).to eq(group)
    end

    it 'has many comments' do
      2.times {Comment.create!(post: post, commenter: author, body: "PLEASE")}
      expect(post.comments.count).to eq(2)
    end

  end
end
