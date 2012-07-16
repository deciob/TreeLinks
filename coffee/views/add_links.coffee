define [ 
  "jquery",
  "underscore",
  "backbone",
  "syphon",
  "mediator",
  "models/link", 
  "models/tag",
  "collections/links",
  "text!templates/add/add_links.hbs" 
], ( $, _, Backbone, Syphon, mediator, LinkModel, TagModel, linksCollection, addLinksTemplate) ->


  AddLinksView = Backbone.View.extend(

    events: 
      "submit form": "updateLinks"

    initialize: ->
      console.debug 'AddLinksView:initialize'
      linksCollection.fetch()
      linksCollection.bind('add', @renderLinksCollection)
      
    exampleBind: (model) ->

    render: ->
      #console.debug "AddLinksView:render"
      data =
        collections: linksCollection.models
        _: _
      compiledTemplate = _.template(addLinksTemplate, data)
      $("#add_links").html compiledTemplate

    updateLinks: (e) ->
      e.preventDefault()
      data = Syphon.serialize @
      @updateCollections data

    updateCollections: (data) ->
      link = @updateModels(data)
      # `link.save()` will not work if called before `linksCollection.add(link)`
      linksCollection.add(link)
      link.save()


    updateModels: (data) ->
      tag_list = data.tags.split ","
      tags = new TagModel(name: t.name) for t in data.tags
      link = new LinkModel( name: data.name, url: data.url, tags: tag_list )
      link.on( "error", @showError, @ )
      link
      

    renderLinksCollection: (collection) ->
      console.debug "AddLinksView:renderLinksCollection"
      mediator.trigger('add:links_collection', collection)


    showError: (model, error) ->
      console.debug "AddLinksView:showError -> #{error}"


  )


  new AddLinksView(el: $("#add_links"))
