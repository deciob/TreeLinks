// Generated by CoffeeScript 1.3.3

define(["underscore", "backbone"], function(_, Backbone) {
  var TagModel;
  TagModel = Backbone.Model.extend({
    defaults: {},
    initialize: function() {},
    validate: function(attrs) {
      if (this.isDuplicate(attrs.name)) {
        return "Tag " + attrs.name + " already exists!";
      }
    },
    isDuplicate: function(name) {
      var filter_set;
      filter_set = this.collection.filter(function(tag) {
        return tag.get("name") === name;
      });
      if (filter_set.length > 1) {
        return true;
      }
    }
  });
  return TagModel;
});
