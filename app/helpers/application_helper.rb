module ApplicationHelper
  def project_list
    Project.all.map{ |project| [project.name, project.id] }
  end

  def user_list
    User.all.map{ |user| [user.first_name, user.last_name, user.id] }
  end
end
