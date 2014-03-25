require 'spec_helper'

describe Comment do
  let(:user) {User.create!(first_name: 'Lana', last_name: 'Kane', email: 'lkane@isis.com', launcher_or_ee: 'Launcher')}
  let(:poster) {User.create!(first_name: 'Joe', last_name: 'Schmo', email: 'someone@somthing.com', launcher_or_ee: 'Launcher')}
  let(:user_group) {User.create!(first_name: 'Louise', last_name: 'Kessel', email: 'email@net.com', launcher_or_ee: 'Launcher')}
  let(:interest_group) {InterestGroup.create!(name: 'Steve', creator: user_group)}
  let(:post) {Post.create!(poster: poster, title: 'Stuff', body: 'is definitely stuff', posted_at: Time.now, interest_group: interest_group)}
  let(:valid_attrs) { { user: user, body: 'This is the body', post: post }}

  describe 'validations' do
    context 'when given valid attributes' do
      it 'is valid' do
        comment = Comment.new(valid_attrs)
        expect(comment).to be_valid
      end
    end
  end
  it 'requires a body' do
    comment = Comment.new(valid_attrs.merge(body: ''))
    comment.valid?
    expect(comment.errors[:body]).to include "can't be blank"
  end

  describe 'associations' do
    it 'belongs to a user' do
      comment = Comment.create!(valid_attrs)
      expect(comment.user).to eq user
    end

    it 'belongs to a post' do
      comment = Comment.create!(valid_attrs)
      expect(comment.post).to eq post
    end
  end









end
