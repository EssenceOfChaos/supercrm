class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title, type: String
  field :description, type: String
  field :priority, type: Integer
  field :due, type: DateTime, default: Time.now
  field :user, type: String, default: @user



  # scope :tomorrow, -> DateTime.now.tomorrow.to_date
end
