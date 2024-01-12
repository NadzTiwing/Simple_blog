class Article < ApplicationRecord
    has_rich_text :text
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { maximum: 250 }
    validates :author_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email address" }
end
