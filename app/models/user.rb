class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, foreign_key: "author_id", dependent: :destroy
  has_many :chat_members, dependent: :destroy
  has_many :chats, through: :chat_members, dependent: :destroy

  validates :login, uniqueness: true

  def start_chat_with(members)
    chat = Chat.create!(founder: self)
    
    if members.is_a? Array 
      members.each { chat.add_member(members) }
    else
      chat.add_member(members)
    end
  end
end
