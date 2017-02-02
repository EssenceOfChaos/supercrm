json.extract! customer, :id, :first_name, :last_name, :email, :primary_phone, :secondary_phone, :address, :created_at, :updated_at
json.url customer_url(customer, format: :json)