class AddAuthorDetails < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :author, :string
    add_column :articles, :author_email, :string
  end
end
