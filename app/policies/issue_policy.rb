# frozen_string_literal: true

# its Issue policy
class IssuePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    user.role == 'project_manager'
  end

  def edit?
    new? || user == record.qa || user == record.developer
  end

  def create?
    new?
  end

  def destroy?
    edit?
  end

  def update?
    edit?
  end

  def show?
    edit?
  end

  def qa_show?
    new? || user == record.qa
  end
end
