class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :priority, type: Integer
  field :due, type: DateTime
  field :user, type: String, default: @user

def date
	date = Date.civil(params[:event]["date(1i)"].to_i,params[:event]["date(2i)"].to_i,params[:event]["date(3i)"].to_i)
end


  # scope :tomorrow, -> DateTime.now.tomorrow.to_date
end
