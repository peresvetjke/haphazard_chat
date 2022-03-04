class Chat < ApplicationRecord
  belongs_to :founder, class_name: 'User'
  has_many :chat_members
  has_many :members, through: :chat_members, source: :user
  # accepts_nested_attributes_for :chat_members, reject_if: :all_blank, allow_destroy: true

  def add_member!(user)
    self.chat_members.create!(user: user)
  end
end
