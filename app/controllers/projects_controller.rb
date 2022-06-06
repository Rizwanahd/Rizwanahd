# frozen_string_literal: true

# its projectcontroller
class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_and_authorize_project, only: %i[show edit update destroy destroy_user add_user]
  before_action :load_qa_and_developers_users, only: [:show]

  def index
    # @projects = Project.all
    @projects = policy_scope(Project)
  end

  def show
    @project = Project.includes(:users, issues: %i[qa developer]).find(params[:id])
  end

  def new
    @project = Project.new
    authorize(@project)
    flash.now[:success] = 'New Project'
  end

  def create
    @project = Project.new(project_params)
    @project.creator = current_user
    authorize(@project)
    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    flash.now[:success] = 'Project edit here'
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy!
    redirect_to projects_path, status: :see_other
  end

  def find_project_by_user
    @project = current_user.projects.find(params[:id])
    authorize(@project)
  end

  def destroy_user
    @user_project = @project.user_projects.find_by(user_id: params[:user_id])
    @user_project.destroy!
    redirect_to Project.find(params[:id])
  end

  def add_user
    user_project = UserProject.new(project_id: params[:id], user_id: params[:user_id])
    user_project.save
    redirect_to Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def find_and_authorize_project
    @project = Project.find(params[:id])
    authorize(@project)
  end

  def load_qa_and_developers_users
    @users = User.where(role: %i[qa developer])
  end
end
