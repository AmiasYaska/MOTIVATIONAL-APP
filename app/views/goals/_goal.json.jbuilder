json.extract! goal, :id, :title, :description, :created_at, :updated_at
json.url goal_url(goal, format: :json)
json.description goal.description.to_s
