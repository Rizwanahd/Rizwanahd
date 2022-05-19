# frozen_string_literal: true

# its project policy
class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    # scope.all
    # end
  end

  def new?
    user.role == 'project_manager'
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def delete?
    new?
  end

  def show?
    new? || user.projects.include?(record)
  end

  def add_user?
    new?
  end

  def destroy_user?
    new?
  end
end
