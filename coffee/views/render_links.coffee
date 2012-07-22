define [ 
  "jquery",
  "underscore",
  "handlebars",
  "backbone",
  "syphon",
  "mediator",
  "models/link",
  "models/tag",
  "text!templates/render/render_links.hbs" 
], ( $, _, Handlebars, Backbone, Syphon, mediator, LinkModel, TagModel, renderLinksTemplate) ->


  RenderLinksView = Backbone.View.extend(

    initialize: ->
      #console.debug 'RenderLinksView:initialize'
      mediator.on 'add:links_collection', @render, @
      mediator.on 'fetch:links_collection', @renderInit, @

    # Re-renders all links on every add:link.
    render: (link) ->
      data = links: link.collection.toJSON()
      template = Handlebars.compile renderLinksTemplate
      $("#link-collections").html template(data) 

    # Renders all saved links on page open.
    renderInit: (links) ->
      data = links: links
      template = Handlebars.compile renderLinksTemplate
      $("#link-collections").html template(data)

  )


  new RenderLinksView(el: $("#link-collections"))
