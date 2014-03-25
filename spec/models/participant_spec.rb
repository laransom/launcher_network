require 'spec_helper'

describe Participant do
  let(:user) {User.create!(first_name: 'Joe', last_name: 'Schmo', email: 'someone@somthing.com', launcher_or_ee: 'Launcher')}
  let(:interest_group) {InterestGroup.create!(name: 'interests', creator: user, description: 'a thing')}
  let(:valid_attrs) { { user: user, interest_group: interest_group } }
  describe 'associations' do
    it 'should have a user' do
      participant = Participant.create!(valid_attrs)
      expect(participant.user).to eq user
      expect(participant.interest_group).to eq interest_group
    end
  end

end

