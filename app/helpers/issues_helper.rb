# frozen_string_literal: true

# its Issue helper
module IssuesHelper
  def status_list(issue, user)
    options = [issue.status]
    case issue.status
    when 'created'
      options << :in_progress if user.developer? || user.project_manager?
      options << :in_review if user.project_manager?
      options << :fixed if user.project_manager?
    when 'in_progress'
      options << :created if user.project_manager?
      options << :in_review if user.developer? || user.project_manager?
      options << :fixed if user.project_manager?
    when 'in_review'
      options << :created if user.project_manager?
      options << :in_progress if user.project_manager?
      options << :fixed if user.qa? || user.project_manager?
    when 'fixed'
      options << :created if user.project_manager?
      options << :in_progress if user.project_manager?
      options << :in_review if user.project_manager?
    end
    options
  end
end
