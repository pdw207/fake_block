require 'spec_helper'

describe Comment do
    let(:group) { InterestGroup.create(name: "Adams Beard")}


     presidente_attributes = {
          first_name: "Sy",
          last_name: "Sperling",
          email: "sy@hairclubformen.com"
        }

    let!(:presidente) { User.create(presidente_attributes)}

    let(:hair_club)  { InterestGroup.new(name: "Hair Club For Men") }

    user_attributes = { first_name: "Paco", last_name: "Grrrraa",
                           email: "info@example.com", user_type: "Launcher",
                           fun_fact: "The only launcher that does not go to class or speak any english."}

    let!(:user){User.create(user_attributes)}

    let!(:hello_world) {Post.create!(title: "My First Program!!", body:"puts 'hello world'", author: user, interest_group: group)}

    let(:comment){Comment.new(commenter: user, post: hello_world, body: "This article might not be in the right group.")}

    it 'is valid if it has a post and a commenter' do
      expect(comment).to be_valid
    end

    it 'is invalid if it does not have a post' do
      comment.post = nil
      expect(comment).to_not be_valid
      expect(comment.errors[:post]).to be_present
    end

    it 'is invalid if it does not have a commenter' do
      comment.commenter = nil
      expect(comment).to_not be_valid
    end

end
