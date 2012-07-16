define [ 
  "jquery",
  "underscore",
  "handlebars",
  "backbone",
  "syphon",
  "mediator",
  "models/link",
  "models/tag",
  "collections/links",
  "text!templates/render/render_links.hbs" 
], ( $, _, Handlebars, Backbone, Syphon, mediator, LinkModel, TagModel, linksCollection, renderLinksTemplate) ->


  RenderLinksView = Backbone.View.extend(

    initialize: ->
      #console.debug 'RenderLinksView:initialize'
      mediator.on 'add:links_collection', @render, @

    render: (link) ->
      data = links: link.collection.toJSON()
      template = Handlebars.compile renderLinksTemplate
      $("#link-collections").html template(data) 

  )


  new RenderLinksView(el: $("#link-collections"))
