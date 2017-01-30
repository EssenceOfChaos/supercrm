class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title, type: String
  field :description, type: String
  field :priority, type: Integer
  field :due, type: DateTime, default: Time.now
  field :user, type: String, default: @user


 before_validation :parse_date_if_not_null

  field :title, type: String
  field :description, type: String
  field :priority, type: Integer, default: '5'
  field :due, type: DateTime, default: ->{ Time.now }
  field :user, type: String, default: @user

attr_accessor :date_string

def parse_date_if_not_null
    unless self.date_string.nil? || self.date_string == ''
      self.date = Date.strptime self.date_string, '%m/%d/%Y'
    end
  end

end
