# frozen_string_literal: true

# its project policy
class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.project_manager?
        scope.where(creator: user)
      else
        scope.where(id: user.user_projects.pluck(:project_id))
      end
    end
  end

  def new?
    user.role == 'project_manager'
  end

  def edit?
    new? && user == record.creator
  end

  def create?
    new?
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def show?
    edit? || user.projects.include?(record)
  end

  def add_user?
    edit?
  end

  def destroy_user?
    edit?
  end
end
