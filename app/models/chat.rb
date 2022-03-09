class Chat < ApplicationRecord
  belongs_to :founder, class_name: "User"
  has_many :chat_members, dependent: :destroy
  has_many :members, through: :chat_members, source: :user, dependent: :destroy
  has_many :messages, dependent: :destroy

  after_create { |chat| add_member(founder) }

  def add_member(member)
    chat_members.create!(user: member)
  end
  
  def add_message(author:, body:)
    messages.create!(author: author, body: body)
  end
end