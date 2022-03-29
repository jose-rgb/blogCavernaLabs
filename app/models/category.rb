class Category < ApplicationRecord
    #nome obrigatorio, tamanho min = 3
    validates :name, presence: true, length: {minimum: 3}
end
