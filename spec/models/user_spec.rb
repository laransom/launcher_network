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


  describe 'number_of_posts' do
    it 'returns the number of posts' do
      user_1 = User.create(valid_attrs)
      user_2 = User.create(first_name: 'Lana', last_name: 'Kane', email: 'isis@isis.edu', launcher_or_ee: 'Launcher')
      interest_group = InterestGroup.create(name: 'Team Kick Ass', creator: user_2)
      post_1 = Post.create(poster: user_1, title: 'Stuff', body: 'is definitely stuff', posted_at: Time.now, interest_group: interest_group)
      post_2 = Post.create(poster: user_1, title: 'TDD', body: 'is lifezz', posted_at: Time.now, interest_group: interest_group)
      expect(user_1.posts.count).to eq(2)
      expect(user_2.posts.count).to eq(0)
    end
  end
  describe 'number_of_comments' do
    it 'returns the number of commnets' do
      user_1 = User.create(valid_attrs)
      user_2 = User.create(first_name: 'Lana', last_name: 'Kane', email: 'isis@isis.edu', launcher_or_ee: 'Launcher')
      interest_group = InterestGroup.create(name: 'Team Kick Ass', creator: user_2)
      post = Post.create(poster: user_1, title: 'Stuff', body: 'is definitely stuff', posted_at: Time.now, interest_group: interest_group)
      comment_1 = Comment.create(user: user_1, body: 'This is the body', post: post)
      comment_2 = Comment.create(user: user_1, body: 'This is a great post!', post: post)
      expect(user_1.comments.count).to eq(2)
      expect(user_2.comments.count).to eq(0)
    end
  end
  describe 'group membership' do
    it 'returns groups user is participating in' do
      user_1 = User.create!(valid_attrs)
      user_2 = User.create!(first_name: 'Lana', last_name: 'Kane', email: 'isis@isis.edu', launcher_or_ee: 'Launcher')
      user_3 = User.create!(first_name: 'Cyril', last_name: 'Figgus', email: 'controller@isis.edu', launcher_or_ee: 'Launcher')
      interest_group_1 = InterestGroup.create!(name: 'Team Kick Ass', creator: user_2)
      interest_group_2 = InterestGroup.create!(name: 'Living in Space', creator: user_2)
      participant_1 = Participant.create!(user: user_2, interest_group: interest_group_1)
      participant_2 = Participant.create!(user: user_2, interest_group: interest_group_2)
      participant_3 = Participant.create!(user: user_1, interest_group: interest_group_2)
      expect(user_1.interest_groups.count).to eq(1)
      expect(user_2.interest_groups.count).to eq(2)
      expect(user_3.interest_groups.count).to eq(0)
    end
  end
end









