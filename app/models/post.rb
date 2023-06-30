class Post < ApplicationRecord


    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :text, presence: true, length: { maximum: 195 }
    validates :mode, presence: true
    validates :nop, presence: true

end
