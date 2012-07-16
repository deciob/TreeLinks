define [ 
  "jquery", 
  "underscore", 
  "backbone",
  "views/render_links", 
  "views/add_links", 
  "views/add_tags"
], ($, _, Backbone, renderLinksView, addLinksView, addTagsView) ->


  AppRouter = Backbone.Router.extend(

    routes:
      #links: "addLinks"
      "*actions": "defaultRoute"

    defaultRoute: (actions) ->
      console.debug "AppRouter:defaultRoute"
      addLinksView.render()
      addTagsView.render()
  )


  initialize = ->
    app_router = new AppRouter()
    Backbone.history.start()


  initialize: initialize



