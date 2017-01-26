class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :priority, type: Integer
  field :due, type: DateTime, default: tomorrow
  field :user, type: String, default: current_user



  scope :tomorrow, -> DateTime.now.tomorrow.to_date
end
