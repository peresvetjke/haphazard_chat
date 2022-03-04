require 'rails_helper'

RSpec.describe Chat, type: :model do
  it { should belong_to(:founder).class_name('User') }
  it { should have_many(:members).class_name('User').through(:chat_members) }
end
