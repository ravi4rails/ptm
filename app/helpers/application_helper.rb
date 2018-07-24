module ApplicationHelper
  def project_list
    Project.all.map{ |project| [project.name, project.id] }
  end
end
