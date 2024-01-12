class ChangeColumnToNewFromArticle < ActiveRecord::Migration[7.1]
  def change
    change_column(:articles, :text, :rich_text)
  end
end
