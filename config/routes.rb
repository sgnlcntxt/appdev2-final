Rails.application.routes.draw do



  # Routes for the Match resource:

  # CREATE
  post("/insert_match", { :controller => "matches", :action => "create" })
          
  # READ
  get("/matches", { :controller => "matches", :action => "index" })
  
  get("/matches/:path_id", { :controller => "matches", :action => "show" })
  
  # UPDATE
  
  post("/modify_match/:path_id", { :controller => "matches", :action => "update" })
  
  # DELETE
  get("/delete_match/:path_id", { :controller => "matches", :action => "destroy" })

  #------------------------------

  # Routes for the Hatch resource:

  # CREATE
  post("/insert_hatch", { :controller => "hatches", :action => "create" })
          
  # READ
  get("/hatches", { :controller => "hatches", :action => "index" })
  
  get("/hatches/:path_id", { :controller => "hatches", :action => "show" })
  
  # UPDATE
  
  post("/modify_hatch/:path_id", { :controller => "hatches", :action => "update" })
  
  # DELETE
  get("/delete_hatch/:path_id", { :controller => "hatches", :action => "destroy" })

  #------------------------------

  # Routes for the Bug resource:

  # CREATE
  post("/insert_bug", { :controller => "bugs", :action => "create" })
          
  # READ
  get("/bugs", { :controller => "bugs", :action => "index" })
  
  get("/bugs/:path_id", { :controller => "bugs", :action => "show" })
  
  # UPDATE
  
  post("/modify_bug/:path_id", { :controller => "bugs", :action => "update" })
  
  # DELETE
  get("/delete_bug/:path_id", { :controller => "bugs", :action => "destroy" })

  #------------------------------

  # Routes for the Fly resource:

  # CREATE
  post("/insert_fly", { :controller => "flies", :action => "create" })
          
  # READ
  get("/flies", { :controller => "flies", :action => "index" })
  
  get("/flies/:path_id", { :controller => "flies", :action => "show" })
  
  # UPDATE
  
  post("/modify_fly/:path_id", { :controller => "flies", :action => "update" })
  
  # DELETE
  get("/delete_fly/:path_id", { :controller => "flies", :action => "destroy" })

  #------------------------------

  # Routes for the Waterbody resource:

  # CREATE
  post("/insert_waterbody", { :controller => "waterbodies", :action => "create" })
          
  # READ
  get("/waterbodies", { :controller => "waterbodies", :action => "index" })
  
  get("/waterbodies/:path_id", { :controller => "waterbodies", :action => "show" })
  
  # UPDATE
  
  post("/modify_waterbody/:path_id", { :controller => "waterbodies", :action => "update" })
  
  # DELETE
  get("/delete_waterbody/:path_id", { :controller => "waterbodies", :action => "destroy" })

  #------------------------------

  devise_for :users
end
