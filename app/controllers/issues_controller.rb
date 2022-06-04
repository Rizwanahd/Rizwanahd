# frozen_string_literal: true

# its projectcontroller
class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :find_and_authorize_issue, only: %i[show update edit destroy]

  def index
    # @issues = issue.all
    # @issues = policy_scope(issue)
  end

  def show
    flash.now[:success] = 'issue details here'
  end

  def new
    @issue = Issue.new
    @issue.project = @project
    # authorize(@issue)
    flash.now[:success] = 'New issue'
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.project = @project
    @issue.creator = current_user
    # authorize(@issue)
    if @issue.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    flash.now[:success] = 'issue edit here'
  end

  def update
    if @issue.update(issue_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @issue.destroy!
    redirect_to project_path, status: :see_other
  end

  def find_issue_by_user
    @issue = current_user.issues.find(params[:id])
    # authorize(@issue)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:name, :issue_type, :status)
  end

  def find_and_authorize_issue
    @issue = Issue.find(params[:id])
    # authorize(@issue)
  end
end
