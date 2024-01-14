require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "associations" do
    it { should have_rich_text(:text) }
    it { should have_many(:comments) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_presence_of(:author_email) }
    it { should allow_value('author@example.com').for(:author_email) }
    it { should_not allow_value('123231').for(:author_email) }
  end
end
