require 'spec_helper'

describe Post do
  let(:poster) {User.create!(first_name: 'Joe', last_name: 'Schmo', email: 'someone@somthing.com', launcher_or_ee: 'Launcher')}
  let(:user) {User.create!(first_name: 'Lana', last_name: 'Kane', email: 'lkane@isis.com', launcher_or_ee: 'Launcher')}
  let(:interest_group) {InterestGroup.create!(name: 'Steve', creator: user)}
  let(:valid_attrs) { { poster: poster, title: 'Stuff', body: 'is definitely stuff', posted_at: Time.now, interest_group: interest_group } }

  describe 'validations' do
    context "when given valid attributes" do
      it "is valid" do
        post = Post.new(valid_attrs)
        expect(post).to be_valid
      end
    end
  end

  it 'requires a poster' do
    post = Post.new(valid_attrs.merge(poster: nil))
    expect(post).to_not be_valid
    expect(post.errors[:poster_id]).to include "can't be blank"
  end

  it 'requires a title' do
    post = Post.new(valid_attrs.merge(title: ''))
    expect(post).to_not be_valid
    expect(post.errors[:title]).to include "can't be blank"
  end

  it 'requires a body' do
    post = Post.new(valid_attrs.merge(body: ''))
    expect(post).to_not be_valid
    expect(post.errors[:body]).to include "can't be blank"
  end

  it 'requires a posted at time' do
    post = Post.new(valid_attrs.merge(posted_at: nil))
    expect(post).to_not be_valid
    expect(post.errors[:posted_at]).to include "can't be blank"
  end

  it 'requires a interest group' do
    post = Post.new(valid_attrs.merge(interest_group: nil))
    expect(post).to_not be_valid
    expect(post.errors[:interest_group_id]).to include "can't be blank"
  end

  describe 'associations' do
    it 'belongs to a poster' do
      post = Post.create!(valid_attrs)
      expect(post.poster).to eq poster
    end

    it 'belongs to a interest group' do
      post = Post.create!(valid_attrs)
      expect(post.interest_group).to eq interest_group
    end
  end
end



















