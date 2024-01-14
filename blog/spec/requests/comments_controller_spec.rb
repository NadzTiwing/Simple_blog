require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new comment" do
        article = Article.create(
          title: "Sample Article",
          author: "John Doe",
          author_email: "john@example.com",
          text: "This is the content of the article."
        )
        comment_attr = {
          commenter: "Joe",
          body: "This is a comment"
        }
        expect {
          post :create, params: { article_id: article.id, comment: comment_attr }
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the article page" do
        article = Article.create(
          title: "Sample Article",
          author: "John Doe",
          author_email: "john@example.com",
          text: "This is the content of the article."
        )
        comment_attr = {
          commenter: "Joe",
          body: "This is a comment"
        }
        post :create, params: { article_id: article.id, comment: comment_attr }
        expect(response).to redirect_to(article_path(article))
      end
    end

    context "with invalid parameters" do
      it "does not create a new comment" do
        article = Article.create(
          title: "Sample Article",
          author: "John Doe",
          author_email: "john@example.com",
          text: "This is the content of the article."
        )
        comment_attr = {
          commenter: nil,
          body: "this is a comment"
        }
        expect {
          post :create, params: { article_id: article.id, comment: comment_attr }
        }.to_not change(Comment, :count)
      end
    end
  end
end
