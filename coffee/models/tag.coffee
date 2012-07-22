define [ 
  "underscore",
  "backbone"
], (_, Backbone) ->


  TagModel = Backbone.Model.extend(

    defaults: {}

    initialize: ->


    validate: (attrs) ->
      if @isDuplicate(attrs.name)
        return "Tag #{attrs.name} already exists!"

    isDuplicate: (name) ->
      filter_set = @collection.filter( (tag) ->
        tag.get("name") is name
      )
      if filter_set.length > 1 then return yes

  )


  TagModel
