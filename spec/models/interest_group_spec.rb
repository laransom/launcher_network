require 'spec_helper'

describe InterestGroup do
  let(:user) {User.create!(first_name: 'Joe', last_name: 'Schmo', email: 'someone@somthing.com', launcher_or_ee: 'Launcher')}
  let(:valid_attrs) { { name: 'Steve', creator: user } }

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        interest_group = InterestGroup.new(valid_attrs)
        expect(interest_group).to be_valid
      end

    end
  end

  it 'requires a name' do
    interest_group = InterestGroup.new(valid_attrs.merge(name: ''))
    expect(interest_group).to_not be_valid
    expect(interest_group.errors[:name]).to include "can't be blank"
  end

  it 'requires a creator' do
  interest_group = InterestGroup.new(valid_attrs.merge(creator: nil))
  expect(interest_group).to_not be_valid
  expect(interest_group.errors[:creator_id]).to include "can't be blank"

  end

  it 'optionally takes a description' do
    interest_group_no_desc = InterestGroup.new(valid_attrs)
    interest_group = InterestGroup.new(valid_attrs.merge(description: "I'm a description!!"))
    expect(interest_group_no_desc).to be_valid
    expect(interest_group).to be_valid
  end


  describe 'associations' do
    it 'should have a creator' do
      creator_attributes = {
        first_name: "Barry",
        last_name: "Zuckercorn",
        email: "barry@hesverygood.com",
        launcher_or_ee: "Launcher"
      }
      creator = User.create(creator_attributes)

      group_attributes = {
        name: "Excuses",
        creator: creator
      }
      group = InterestGroup.create(group_attributes)
      expect(group.creator).to eq creator
    end

    describe 'instance methods' do
      describe '#number_of_posts' do

      end
    end
  end

end

