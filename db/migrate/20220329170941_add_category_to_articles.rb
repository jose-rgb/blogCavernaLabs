class AddCategoryToArticles < ActiveRecord::Migration[6.1]
  def change
    #adicionar no article um id para referenciar category
    add_reference :articles, :category, null: false, foreign_key: true
  end
end
