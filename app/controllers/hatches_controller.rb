class HatchesController < ApplicationController
  def index
    matching_hatches = Hatch.all

    @list_of_hatches = matching_hatches.order({ :created_at => :desc })

    render({ :template => "hatches/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_hatches = Hatch.where({ :id => the_id })

    @the_hatch = matching_hatches.at(0)

    render({ :template => "hatches/show.html.erb" })
  end

  def create
    the_hatch = Hatch.new
    the_hatch.bug_id = params.fetch("query_bug_id")
    the_hatch.start_date = params.fetch("query_start_date")
    the_hatch.end_date = params.fetch("query_end_date")
    the_hatch.waterbody_id = params.fetch("query_waterbody_id")
    the_hatch.minimum_size = params.fetch("query_minimum_size")
    the_hatch.maximum_size = params.fetch("query_maximum_size")

    if the_hatch.valid?
      the_hatch.save
      redirect_to("/hatches", { :notice => "Hatch created successfully." })
    else
      redirect_to("/hatches", { :alert => the_hatch.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_hatch = Hatch.where({ :id => the_id }).at(0)

    the_hatch.bug_id = params.fetch("query_bug_id")
    the_hatch.start_date = params.fetch("query_start_date")
    the_hatch.end_date = params.fetch("query_end_date")
    the_hatch.waterbody_id = params.fetch("query_waterbody_id")
    the_hatch.minimum_size = params.fetch("query_minimum_size")
    the_hatch.maximum_size = params.fetch("query_maximum_size")

    if the_hatch.valid?
      the_hatch.save
      redirect_to("/hatches/#{the_hatch.id}", { :notice => "Hatch updated successfully."} )
    else
      redirect_to("/hatches/#{the_hatch.id}", { :alert => the_hatch.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_hatch = Hatch.where({ :id => the_id }).at(0)

    the_hatch.destroy

    redirect_to("/hatches", { :notice => "Hatch deleted successfully."} )
  end
end
