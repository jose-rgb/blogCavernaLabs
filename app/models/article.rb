class Article < ApplicationRecord
    #pertence a um user
    belongs_to :user
    
    #pertence a uma categoria
    belongs_to :category

    #um artigo pode ter varios comments, destruir artigo -> comments
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: {minimum: 5}
    validates :body, presence: true, length: {minimum: 10}

    #kaminari, quantos artigos exibir por page
    paginates_per 10

    scope :desc_order, -> { order(created_at: :desc) }
    scope :without_highlights, -> (ids)  {where("id NOT IN(#{ids})") if ids.present?}
    scope :filter_by_category, -> (category)  {where category_id: category.id if category.present?}
    scope :filter_by_archive, lambda { |month_year|
        if month_year 
            #transformar str em date 
            date = Date.strptime(month_year, '%B %Y')
            where created_at: date.beginning_of_month..date.end_of_month.next_day
        end
    }
end
