require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      article = Article.create(
      title: "Sample Article",
      author: "John Doe",
      author_email: "john@example.com",
      text: "This is the content of the article."
    )
      get :show, params: { id: article.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new article" do
        expect {
          post :create, params: { article: {
            title: "Sample Title",
            author: "Sample Author",
            author_email: "author@example.com",
            text: "Sample Text"
          }
        } }.to change(Article, :count).by(1)
      end

      it "redirects to the new article" do
        post :create, params: { article: {
          title: "Sample Title",
          author: "Sample Author",
          author_email: "author@example.com",
          text: "Sample Text"
        } }
        expect(response).to redirect_to(Article.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new article" do
        expect {
          post :create, params: {article: {
            title: "",
            author: "Sample Author",
            author_email: "author@example.com",
            text: "Sample Text"
          } }
        }.to_not change(Article, :count)
      end
    end
  end
end
