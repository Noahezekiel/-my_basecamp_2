class SearchController < ApplicationController
  def index
    @query = params[:query]
    @projects = Project.where("name ILIKE ?", "%#{@query}%")
  end
end
