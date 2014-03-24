require 'spec_helper'

describe InterestGroup do
  let(:vaid_attrs) { { name: 'Steve' } }

  describe 'validations' do
    context "when given valid attributes" do

      it "is valid" do
        interest_group = InterestGroup.new(valid_attrs)
        expect(interest_group).to be_valid
      end

    end

    it 'requires a name' do
      interest_group = InterestGroup.new(valid_attrs.merge(name: ''))
      expect(interest_group.errors[:name]).to include "can't be blank"
    end

    it 'requires a creator'

    end

    it 'optionally takes a description'

    end
  end

  describe 'associations' do
    it 'should have a creator' do
      creator_attributes = {
        first_name: "Barry",
        last_name: "Zuckercorn"
        email: "barry@hesverygood.com"
      }
      creator = User.create(creator_attributes)

      group_attributes = {
        name: "Excuses",
        creator: creator
      }

      group = InterestGroup.greate(group_attributes)
      expect(group.creator).to eq creator
    end
  end

end
