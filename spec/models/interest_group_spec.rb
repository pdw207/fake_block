require 'spec_helper'

describe InterestGroup do
  context 'Validations' do
    let(:interest_group) { InterestGroup.new(name: "Adams Beard")}
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

    it 'should have a owner' do
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

      group.user_interest_groups.create!(user: owner, user_type: 'whatever')


      expect(group.users).to include(owner)
    end


    it "has one or more members (including the owner)"
    it "conntains one or more posts"
    it "counts the number of posts"
    it "finds the top three posts"
  end

end
