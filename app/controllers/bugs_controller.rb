class BugsController < ApplicationController
  def index
    matching_bugs = Bug.all

    @list_of_bugs = matching_bugs.order({ :created_at => :desc })

    render({ :template => "bugs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bugs = Bug.where({ :id => the_id })

    @the_bug = matching_bugs.at(0)

    render({ :template => "bugs/show.html.erb" })
  end

  def create
    the_bug = Bug.new
    the_bug.name = params.fetch("query_name")
    the_bug.photo = params.fetch("query_photo")
    the_bug.description = params.fetch("query_description")

    if the_bug.valid?
      the_bug.save
      redirect_to("/bugs", { :notice => "Bug created successfully." })
    else
      redirect_to("/bugs", { :alert => the_bug.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bug = Bug.where({ :id => the_id }).at(0)

    the_bug.name = params.fetch("query_name")
    the_bug.photo = params.fetch("query_photo")
    the_bug.description = params.fetch("query_description")

    if the_bug.valid?
      the_bug.save
      redirect_to("/bugs/#{the_bug.id}", { :notice => "Bug updated successfully."} )
    else
      redirect_to("/bugs/#{the_bug.id}", { :alert => the_bug.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bug = Bug.where({ :id => the_id }).at(0)

    the_bug.destroy

    redirect_to("/bugs", { :notice => "Bug deleted successfully."} )
  end
end
