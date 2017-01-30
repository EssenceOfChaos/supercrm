class Task
  include Mongoid::Document
  include Mongoid::Timestamps
<<<<<<< HEAD
  include Mongoid::Attributes::Dynamic

  field :title, type: String
  field :description, type: String
  field :priority, type: Integer
  field :due, type: DateTime, default: Time.now
  field :user, type: String, default: @user

=======
 before_validation :parse_date_if_not_null

  field :title, type: String
  field :description, type: String
  field :priority, type: Integer, default: '5'
  field :due, type: Date, default: ->{ Date.today }
  field :user, type: String, default: @user


attr_accessor :date_string

def parse_date_if_not_null
    unless self.date_string.nil? || self.date_string == ''
      self.date = Date.strptime self.date_string, '%m/%d/%Y'
    end
  end
>>>>>>> ae29ce88347e53e4ca22f2f5008a93b0eec9a5b6


  # scope :tomorrow, -> DateTime.now.tomorrow.to_date
end
