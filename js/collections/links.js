// Generated by CoffeeScript 1.3.3

define(["jquery", "underscore", "backbone", "local_storage", "models/link"], function($, _, Backbone, LocalStorage, LinkModel) {
  var LinksCollection;
  LinksCollection = Backbone.Collection.extend({
    model: LinkModel,
    localStorage: new Backbone.LocalStorage("links-backbone"),
    initialize: function() {
      return console.debug("LinksCollection:initialize, localStorage: " + localStorage);
    }
  });
  return new LinksCollection();
});