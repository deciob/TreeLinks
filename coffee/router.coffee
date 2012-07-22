define [ 
  "jquery", 
  "underscore", 
  "backbone",
  "views/render_links", 
  "views/render_tags", 
  "views/add_links"
], ($, _, Backbone, renderLinksView, renderTags, addLinksView) ->


  AppRouter = Backbone.Router.extend(

    routes:
      #links: "addLinks"
      "*actions": "defaultRoute"

    defaultRoute: (actions) ->
      console.debug "AppRouter:defaultRoute"
      #renderTags
      addLinksView.render()
      #addTagsView.render()
  )


  initialize = ->
    app_router = new AppRouter()
    Backbone.history.start()


  initialize: initialize



