require 'spec_helper'

describe User do
  let(:valid_attrs) { { first_name: 'Sterling', last_name: 'Archer', email: 'Sarcher@gmail.com', launcher_or_ee: 'Launcher' } }

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        user = User.new(valid_attrs)
        expect(user).to be_valid
      end
    end
  end

  it 'requires a first name' do
    user = User.new(valid_attrs.merge(first_name: ''))
    expect(user).to_not be_valid
    expect(user.errors[:first_name]).to include "can't be blank"
  end

  it 'requires a last name' do
    user = User.new(valid_attrs.merge(last_name: ''))
    expect(user).to_not be_valid
    expect(user.errors[:last_name]).to include "can't be blank"
  end

  it 'requires an email' do
    user = User.new(valid_attrs.merge(email: ''))
    expect(user).to_not be_valid
    expect(user.errors[:email]).to include "can't be blank"
  end

  it 'requires a valid email' do
    user = User.new(valid_attrs.merge(email: 'abcd'))
    expect(user).to_not be_valid
  end

  it 'requires launcher or ee designation' do
    user = User.new(valid_attrs.merge(launcher_or_ee: ''))
    expect(user).to_not be_valid
    expect(user.errors[:launcher_or_ee]).to include "can't be blank"
  end

  it 'optionally takes a description' do
    user_with_fact = User.new(valid_attrs.merge(fun_fact: 'I like to spy'))
    user_without_fact = User.new(valid_attrs)
    expect(user_with_fact).to be_valid
    expect(user_without_fact).to be_valid
  end

end









