require 'spec_helper'

describe InterestGroup do
  context 'Validations' do

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

    # Create some Awesome Posts
    let!(:lame_post) {Post.create!(title: "Yar", body:"That's it", author: user, interest_group: group)}
    let!(:hello_world) {Post.create!(title: "My First Program!!", body:"puts 'hello world'", author: user, interest_group: group)}
    let!(:hello_everyone) {Post.create!(title: "Attention!", body: "I have arrived!", author: user, interest_group: group)}

    it "invalid if it doesn't have a name" do
      group = InterestGroup.new
      expect(group).to_not be_valid
      expect(group.errors[:name]).to_not be_blank
    end

    it "invalid if it name is not unique." do
      his_group = InterestGroup.create(name: "Soccer")
      her_group = InterestGroup.new(name: "Soccer")
      expect(her_group).to_not be_valid
      expect(her_group.errors[:name]).to_not be_blank
    end

    it 'should have a 2 members' do
      # create a User object
      member_attribute = {
        first_name: "Barry",
        last_name: "Zuckercorn",
        email: "barry@hesverygood.com",
        user_type: "EE"
      }
      member = User.create(member_attribute)

      group.user_interest_groups.create!(user: member, user_type: 'member')
      group.user_interest_groups.create!(user: presidente, user_type: 'owner')
      expect(group.members.count).to eq(2)
    end

    it 'can find an owner of the group' do

      # create a User object
      owner_attributes = {
        first_name: "Barry",
        last_name: "Zuckercorn",
        email: "barry@hesverygood.com",
        user_type: "EE"
      }
      owner = User.create!(owner_attributes)


      group.user_interest_groups.create!(user: owner, user_type: 'owner')
      expect(group.owner).to eq(owner)
    end

    it "contains one or more posts" do
      expect(group.posts.count).to eq(3)
    end

    it "finds the top three posts" do

      20.times do |count|
        Comment.create!(body: "This is my post #{count}", commenter: presidente, post: lame_post)
      end
      15.times do |count|
        Comment.create!(body: "This is my post #{count}", commenter: presidente, post: hello_world)
      end
      10.times do |count|
        Comment.create!(body: "This is my post #{count}", commenter: presidente, post: hello_everyone)
      end
      expect(group.top_posts).to eq([lame_post, hello_world, hello_everyone])
    end
  end

end
