# frozen_string_literal: true

# its projectcontroller
class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @projects = Project.all
  end

  def show
    puts "~~~"*100
    @project = Project.find(params[:id])
    puts(@project.user_projects)
  end

  def new
    @project = Project.new
    authorize Project
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy!
    redirect_to projects_path, status: :see_other
  end

  def find_project_by_user
    @project = current_user.projects.find(params[:id])
  end

  def destroy_user
    @project = Project.find(params[:id])
    @user_project = @project.user_projects.find_by(user_id: params[:user_id])
    @user_project.destroy!
    redirect_to Project.find(params[:id])
  end

  def add_user
    puts "~~~"*100
    puts params
    user_project = UserProject.new(project_id: params[:id], user_id: params[:user_id])
    user_project.save
    redirect_to Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
