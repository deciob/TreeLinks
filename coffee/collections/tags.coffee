define [ 
  "jquery", 
  "underscore", 
  "backbone", 
  "local_storage", 
  "models/tag" 
], ($, _, Backbone, LocalStorage, TagModel) ->

  TagsCollection = Backbone.Collection.extend(

    model: TagModel

    localStorage: new Backbone.LocalStorage("tags-backbone")

    initialize: ->


  )

  
  TagsCollection
