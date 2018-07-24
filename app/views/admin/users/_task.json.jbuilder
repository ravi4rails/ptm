json.extract! user, :id, :first_name, :last_name, :contact, :email, :created_at, :updated_at
json.url admin_user_url(user, format: :json)
