define [ 
  "jquery", 
  "underscore", 
  "backbone", 
  "syphon", 
  "models/tag", 
  "collections/tags",
  "text!templates/add/add_tags.hbs" 
], ($, _, Backbone, Syphon, TagModel, tagsCollection, addTagsTemplate) ->

  addTagsView = Backbone.View.extend(

    render: ->
      #data = {}
      #compiledTemplate = _.template(addTagsTemplate, data)
      #$("#add_tags").html compiledTemplate

  )

  new addTagsView(el: $("add_tags"))

