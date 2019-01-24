class PagesController < ApplicationController
  def home
  end

  def search
    results = PgSearch.multisearch(params[:pg_search].partition(" ").first)
    if results.size == 0
      redirect_to root_path, :alert => "Sorry, no match found."
    else
      @routes = []
      results.each do |r|
        route = Route.find r.searchable_id
        @routes.push(route)
      end
      render 'routes/index'
    # id = result[0].searchable_id
    # @route = Route.find id
    # redirect_to @route
  end
  end
end
