require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:messages).dependent(:destroy) }
    it { should have_many(:chat_members).dependent(:destroy) }
    it { should have_many(:chats).through(:chat_members).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:login) }
  end
end
