define [ 
  "jquery"
  "underscore"
  "backbone"
  "syphon"
  "mediator"
  "models/link"
  "models/tag"
  "collections/links"
  "text!templates/add/add_links.hbs"
  "ui"
], ( $, _, Backbone, Syphon, mediator, LinkModel, TagModel, LinksCollection, addLinksTemplate, ui) ->


  linksCollection = new LinksCollection()

  AddLinksView = Backbone.View.extend(

    events: 
      "submit form": "updateLinks"

    initialize: ->
      console.debug 'AddLinksView:initialize'
      @collection.fetch(success: @renderLinksCollectionOnFetch)
      @collection.bind('add', @renderLinksCollection)


    exampleBind: (model) ->

    render: ->
      #console.debug "AddLinksView:render"
      data =
        collections: @collection.models
        _: _
      compiledTemplate = _.template(addLinksTemplate, data)
      $("#add_links").html compiledTemplate
      $("[title]").tooltip()

    updateLinks: (e) ->
      e.preventDefault()
      data = Syphon.serialize @
      @updateCollections data

    updateCollections: (data) ->
      link = @updateModels(data)
      if link
        # `link.save()` will not work if called before `linksCollection.add(link)`
        @collection.add(link)
        link.save()

    updateModels: (data) ->
      tag_list = data.tags.replace(/^\s+|\s+$/g, "").split ","
      link = new LinkModel( name: data.name, url: data.url, tags: tag_list )
      mediator.trigger('add:tags_collection', tag_list)
      #link.on( "error", @showError, @ )
      valid_link = link.isValid()
      if valid_link
        return link
      else @showError(link, "This is not a correct url!")
      
    renderLinksCollection: (collection) ->
      #console.debug "AddLinksView:renderLinksCollection"
      mediator.trigger('add:links_collection', collection)

    renderLinksCollectionOnFetch: (model, response) ->
      #console.debug "AddLinksView:renderLinksCollectionOnFetch" + 
      #  " - model: #{model}, response: #{response}"
      mediator.trigger('fetch:links_collection', response)

    showError: (model, error) ->
      console.debug "AddLinksView:showError -> #{error}"

  )


  new AddLinksView(
    el: $("#add_links")
    collection: linksCollection
  )
