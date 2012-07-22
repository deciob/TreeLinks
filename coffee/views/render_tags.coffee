define [ 
  "jquery",
  "underscore",
  "handlebars",
  "backbone",
  "syphon",
  "mediator",
  "models/link",
  "models/tag",
  "collections/tags",
  "text!templates/render/render_tags.hbs" 
], ( $, _, Handlebars, Backbone, Syphon, mediator, LinkModel, TagModel, TagsCollection, renderTagsTemplate) ->

  
  tagsCollection = new TagsCollection()


  RenderTagsView = Backbone.View.extend(
    
    initialize: ->
      #console.debug 'RenderTagsView:initialize', @collection
      @collection.fetch(success: @renderInit)
      @collection.bind 'add', @render, @
      mediator.on 'add:tags_collection', @add, @

    add: (tag_list) ->
      #console.debug "add:RenderTagsView - tag_list: #{tag_list}"
      for name in tag_list
        tag = new TagModel(name: name)
        @collection.add(tag)
        if tag.isValid()
          tag.save()
        else @showError(tag, "This tag is not valid!")

    # Renders all saved tags on page open.
    renderInit: (model, response) ->
      data = tags: response
      template = Handlebars.compile renderTagsTemplate
      $("#tags-collections").html template(data)

    render: ->
      tags = @collection.toJSON()
      data = tags: tags
      template = Handlebars.compile renderTagsTemplate
      $("#tags-collections").html template(data) 

    showError: (model, error) ->
      console.debug "RenderTagsView:showError -> #{error}"


  )

  new RenderTagsView(
    el: $("tags-collections")
    collection: tagsCollection
  )

