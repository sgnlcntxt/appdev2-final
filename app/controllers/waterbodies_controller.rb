class WaterbodiesController < ApplicationController
  def index
    matching_waterbodies = Waterbody.all

    @list_of_waterbodies = matching_waterbodies.order({ :created_at => :desc })

    render({ :template => "waterbodies/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_waterbodies = Waterbody.where({ :id => the_id })

    @the_waterbody = matching_waterbodies.at(0)

    render({ :template => "waterbodies/show.html.erb" })
  end

  def create
    the_waterbody = Waterbody.new
    the_waterbody.name = params.fetch("query_name")
    the_waterbody.photo = params.fetch("query_photo")

    if the_waterbody.valid?
      the_waterbody.save
      redirect_to("/waterbodies", { :notice => "Waterbody created successfully." })
    else
      redirect_to("/waterbodies", { :alert => the_waterbody.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_waterbody = Waterbody.where({ :id => the_id }).at(0)

    the_waterbody.name = params.fetch("query_name")
    the_waterbody.photo = params.fetch("query_photo")

    if the_waterbody.valid?
      the_waterbody.save
      redirect_to("/waterbodies/#{the_waterbody.id}", { :notice => "Waterbody updated successfully."} )
    else
      redirect_to("/waterbodies/#{the_waterbody.id}", { :alert => the_waterbody.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_waterbody = Waterbody.where({ :id => the_id }).at(0)

    the_waterbody.destroy

    redirect_to("/waterbodies", { :notice => "Waterbody deleted successfully."} )
  end
end
