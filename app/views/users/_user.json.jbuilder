json.extract! user, :id, :email, :password_digest, :fname, :lname, :is_admin, :status, :created_at, :updated_at
json.url user_url(user, format: :json)
