class FliesController < ApplicationController
  def index
    matching_flies = Fly.all

    @list_of_flies = matching_flies.order({ :created_at => :desc })

    render({ :template => "flies/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_flies = Fly.where({ :id => the_id })

    @the_fly = matching_flies.at(0)

    render({ :template => "flies/show.html.erb" })
  end

  def create
    the_fly = Fly.new
    the_fly.name = params.fetch("query_name")
    the_fly.photo = params.fetch("query_photo")
    the_fly.description = params.fetch("query_description")

    if the_fly.valid?
      the_fly.save
      redirect_to("/flies", { :notice => "Fly created successfully." })
    else
      redirect_to("/flies", { :alert => the_fly.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_fly = Fly.where({ :id => the_id }).at(0)

    the_fly.name = params.fetch("query_name")
    the_fly.photo = params.fetch("query_photo")
    the_fly.description = params.fetch("query_description")

    if the_fly.valid?
      the_fly.save
      redirect_to("/flies/#{the_fly.id}", { :notice => "Fly updated successfully."} )
    else
      redirect_to("/flies/#{the_fly.id}", { :alert => the_fly.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_fly = Fly.where({ :id => the_id }).at(0)

    the_fly.destroy

    redirect_to("/flies", { :notice => "Fly deleted successfully."} )
  end
end
