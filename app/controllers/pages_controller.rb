class PagesController < ApplicationController
  def home
  end

  def search
    result = PgSearch.multisearch(params[:pg_search])
    id = result[0].searchable_id
    @route = Route.find id
    redirect_to @route
  end
end
