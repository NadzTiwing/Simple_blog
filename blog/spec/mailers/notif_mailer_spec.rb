require 'rails_helper'

RSpec.describe NotifMailer, type: :mailer do
  let(:article) { Article.create(title: "Sample Article", author_email: "author@example.com") }
  let(:comment) { Comment.new(commenter: "John Doe", body: "Great comment", article: article) }

  describe "#new_comment_notif" do
    let(:mail) { described_class.new_comment_notif(comment.commenter, article.author_email, comment.body) }

    it "renders the headers" do
      expect(mail.subject).to eq('New Comment on your Blog Post!')
      expect(mail.to).to eq([article.author_email])
      expect(mail.from).to eq(['notifications@example.com'])
    end

    it "renders the body" do
      intro = "You have a new comment from:"

      expect(mail.body.encoded).to include(intro)
      expect(mail.body.encoded).to include(comment.commenter)
      expect(mail.body.encoded).to include(comment.body)
    end
  end
end
