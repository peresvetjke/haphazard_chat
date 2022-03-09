require 'rails_helper'

RSpec.describe ChatMember, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:chat) }
  end
end
