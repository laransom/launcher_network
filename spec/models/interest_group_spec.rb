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
  end


  describe "number_of_posts" do
    it 'returns the number of posts' do
      interest_group = InterestGroup.create!(valid_attrs)
      interest_group_no_posts = InterestGroup.create!(valid_attrs)
      poster = User.create!(first_name: 'Joe', last_name: 'Schmo', email: 'someone@somthing.com', launcher_or_ee: 'Launcher')
      post_1 = Post.create!(poster: poster, title: 'Stuff', body: 'is definitely stuff', posted_at: Time.now, interest_group: interest_group)
      post_2 = Post.create!(poster: poster, title: 'TDD', body: 'is lifezz', posted_at: Time.now, interest_group: interest_group)
      expect(interest_group.posts.count).to eq(2)
      expect(interest_group_no_posts.posts.count).to eq(0)
    end
  end

  describe "most popular posts" do
    it 'returns the 3 most popular posts by comments' do
      interest_group = InterestGroup.create!(valid_attrs)
      poster = User.create!(first_name: 'Joe', last_name: 'Schmo', email: 'someone@somthing.com', launcher_or_ee: 'Launcher')
      post_1 = Post.create!(poster: poster, title: 'Stuff', body: 'is definitely stuff', posted_at: Time.now, interest_group: interest_group)
      post_2 = Post.create!(poster: poster, title: 'TDD', body: 'is lifezz', posted_at: Time.now, interest_group: interest_group)
      post_3 = Post.create!(poster: poster, title: 'Hey', body: 'Mick Jagger is Boss', posted_at: Time.now, interest_group: interest_group)
      post_4 = Post.create!(poster: poster, title: 'You', body: '*dancing*', posted_at: Time.now, interest_group: interest_group)
      comment_1 = Comment.create!(user: poster, body: 'This is the body', post: post_1)
      comment_2 = Comment.create!(user: poster, body: 'Moar Comments', post: post_1)
      comment_3 = Comment.create!(user: poster, body: 'Different post', post: post_4)
      comment_4 = Comment.create!(user: poster, body: 'Hartford Whalers are amazing', post: post_3)
      # binding.pry
      expect(Post.favorites).to match_array([post_1, post_3, post_4])


    end
  end



end

