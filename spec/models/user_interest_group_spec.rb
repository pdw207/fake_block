require 'spec_helper'

describe UserInterestGroup do
  user_attributes = { first_name: "Paco", last_name: "Grrrraa",
                         email: "info@example.com", user_type: "Launcher",
                         fun_fact: "The only launcher that does not go to class or speak any english."
                    }

  let(:user){User.create(user_attributes)}
  let(:group) { InterestGroup.create(name: "Adams Beard")}

  let(:user_group_object){UserInterestGroup.new(user_id: user.id, interest_group_id: group.id, user_type: "owner")}

  it 'is valid if it belongs to users' do
    expect(user_group_object.user).to be_valid
  end

  it 'is invalid if it does not have a user' do
    user_group_object.user_id = nil
    expect(user_group_object).to_not be_valid
    expect(user_group_object.errors[:user_id]).to be_present
  end

  it 'is invalid if it does not have a group' do
    user_group_object.interest_group_id = nil
    expect(user_group_object).to_not be_valid
    expect(user_group_object.errors[:interest_group_id]).to be_present
  end
  it 'is invalid if it does not have a user_type' do
    user_group_object.user_type = nil
    expect(user_group_object).to_not be_valid
    expect(user_group_object.errors[:user_type]).to be_present
  end
end
