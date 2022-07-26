class Blog < ApplicationRecord
    validates :title, :body, presence: true, length: {minimum: 6, maximum:30}
    belongs_to :user
   end
