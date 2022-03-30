class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  #todos podem ver
  def show?
    true
  end

  def create?
    user&.id
  end

  #so vai atualizar quem for autor
  def update?
    user&.id == record.user.id
  end

   #so vai deletar quem for autor
  def destroy?
    user&.id == record.user.id
  end
end
