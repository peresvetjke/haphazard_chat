require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "associations" do
    it { should belong_to(:chat) }
    it { should belong_to(:author).class_name('User') }
  end
  
  describe "validations" do
    it { should validate_presence_of(:body) }
  end
end
