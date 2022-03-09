class Message < ApplicationRecord
  default_scope { order(created_at: :desc) }

  after_create_commit { broadcast_append_to "messages" }
  after_update_commit { broadcast_replace_to "messages" }
  after_destroy_commit { broadcast_remove_to "messages" }
  
  belongs_to :chat
  belongs_to :author, class_name: "User"

  validates :body, presence: true
end
