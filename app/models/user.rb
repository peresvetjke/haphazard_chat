class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :login, uniqueness: true

  def start_chat_with(user)
    chat = Chat.create!(founder: self)
    chat.add_member!(self)
    chat.add_member!(user)
    chat
  end
end