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

    pending "Relationships between other models"

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
      owner = User.create(owner_attributes)

      # create an InterestGroup object with that user object as the owner
      group_attributes = {
        name: "Adams Beard"
      }
      group = InterestGroup.create(group_attributes)

      group.user_interest_groups.create!(user: owner, user_type: 'owner')
      expect(group.owner).to eq(owner)
    end

    it "conntains one or more posts"
    it "counts the number of posts"
    it "finds the top three posts"
  end

end
