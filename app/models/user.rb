class User < ApplicationRecord
  rolify
  # um user tem muitos artigos, se apagar user->apagar artigos
  has_many  :articles, dependent: :destroy
  #um usuario tem varios comments, deletar user -> comments
  has_many  :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable,  and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
