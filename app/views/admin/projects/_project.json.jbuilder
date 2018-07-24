json.extract! project, :id, :name, :description, :created_at, :updated_at
json.url admin_project_url(project, format: :json)
