class CountriesController < ApplicationController

	 def getdata
    # this contains what has been selected in the first select box
    @data_from_country_select = params[:country_select]

    # we get the data for selectbox 2
    @data_for_state_select = MyModel.where(:some_id => @data_from_country_select).all

    # render an array in JSON containing arrays like:
    # [[:id1, :name1], [:id2, :name2]]
    render :json => @data_for_state_select.reduce{|c| [c.id, c.name]}
  end

end
