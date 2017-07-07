class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :validate_search_key, only: [:search]

  def index
    @users = User.all
  end

  def search
    if @query_string.present?
      search_result = User.ransack(@search_criteria).result(:distinct => true)
      @users = search_result.paginate(:page => params[:page], :per_page => 8 )
  end
end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :name_cont => query_string }
  end

end
