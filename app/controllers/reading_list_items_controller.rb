class ReadingListItemsController < ApplicationController
  def index
    # informing the view which css file to style (styling)
    @reading_list_items_index = true
    # depending on whether the user wants to see current or archived reading list (param sets)
    set_view
    # search the page/website for shit you are allowed to see
    generate_algolia_search_key
  end

  def update
    # a Reaction can be reading_list addition, or a literal reaction to an article (positve (maybe negative))
    @reaction = Reaction.find(params[:id])
    # return unauth json if not valid user id/session
    not_authorized if @reaction.user_id != session_current_user_id
    # save reactions
    @reaction.status = params[:current_status] == "archived" ? "valid" : "archived"
    @reaction.save
    # response without content, only headers
    head :ok
  end

  private

  def generate_algolia_search_key
    # retreive session user id, allowing certain search results based on user type
    params = { filters: "viewable_by:#{session_current_user_id}" }
    # must need a valid serach key in order to use search on certain pages...
    @secured_algolia_key = Algolia.generate_secured_api_key(
      ApplicationConfig["ALGOLIASEARCH_SEARCH_ONLY_KEY"], params
    )
  end

  # helper methods showing archived or valid articles
  def set_view
    @view = if params[:view] == "archive"
              "archived"
            else
              "valid"
            end
  end
end
