json.extract! teaching_material, :id, :name, :url, :created_at, :updated_at
json.url teaching_material_url(teaching_material, format: :json)
