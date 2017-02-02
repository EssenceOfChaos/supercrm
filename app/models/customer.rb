class Customer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :primary_phone, type: String
	field :address, type: String
	field :address_apt, type: String
	field :address_city, type: String
	field :address_state, type: String
	field :address_zip, type: String
	field :address_country_code, type: String, default: 'US'

  ## validations ##

  validates :email, uniqueness: { case_sensitive: false }
end
