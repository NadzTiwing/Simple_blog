# comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "associations" do
    it { should belong_to(:article) }
  end
end
