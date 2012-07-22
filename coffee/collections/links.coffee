define [ 
  "jquery", 
  "underscore", 
  "backbone", 
  "local_storage",
  "models/link" 
], ($, _, Backbone, LocalStorage, LinkModel) ->


  LinksCollection = Backbone.Collection.extend(

    model: LinkModel

    localStorage: new Backbone.LocalStorage("links-backbone")

    initialize: ->
      console.debug "LinksCollection:initialize, localStorage: #{localStorage}"

  )


  LinksCollection
