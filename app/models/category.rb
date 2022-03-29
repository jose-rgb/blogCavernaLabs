class Category < ApplicationRecord
    #uma categoria tem muitos artigos
    has_many :articles, dependent: :restrict_with_error

    #nome obrigatorio, tamanho min = 3
    validates :name, presence: true, length: {minimum: 3}

    #ordem alfabetica
    scope :sorted, -> { order(:name) }
end
