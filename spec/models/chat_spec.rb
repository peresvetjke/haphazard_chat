require 'rails_helper'

RSpec.describe Chat, type: :model do
  describe "associations" do
    it { should belong_to(:founder).class_name('User') }
    it { should have_many(:chat_members).dependent(:destroy) }
    it { should have_many(:members).dependent(:destroy).through(:chat_members) }
    it { should have_many(:messages).dependent(:destroy) }
  end
end
