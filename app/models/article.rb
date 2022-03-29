class Article < ApplicationRecord
    #pertence a um user
    belongs_to :user
    
    #pertence a uma categoria
    belongs_to :category

    validates :title, presence: true, length: {minimum: 5}
    validates :body, presence: true, length: {minimum: 10}

    #kaminari, quantos artigos exibir por page
    paginates_per 2

    scope :desc_order, -> { order(created_at: :desc) }
    scope :without_highlights, -> (ids)  {where("id NOT IN(#{ids})") if ids.present?}
end
