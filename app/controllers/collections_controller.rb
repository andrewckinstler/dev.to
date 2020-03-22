class CollectionsController < ApplicationController
  def index
    # require "pry"; binding.pry
    # @resources = Collection.all.paginate(10, params[:page])
  end

  # Define a custom finder by overriding the `find_resource` method:
  # def find_resource(param)
  #   Collection.find_by!(slug: param)
  # end
end
