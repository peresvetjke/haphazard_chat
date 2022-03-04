require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user)          { create(:user) }
  let(:another_user)  { create(:user) }

  it { should validate_uniqueness_of(:login) }

  describe "#start_chat_with" do
    subject { user.start_chat_with(another_user) }

    it "creates new chat in db" do
      expect { subject }.to change(Chat, :count).by(1)
    end

    it "assigns founder" do
      expect(subject.founder).to eq(user)
    end

    it "assigns two chat members" do
      expect(subject.members).to match_array([user, another_user])
    end
  end
end
