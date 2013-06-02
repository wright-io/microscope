Template.header.helpers {
  activeRouteClass: ->
    args = Array.prototype.slice.call arguments, 0
    args.pop()

    active = _.any args, (name) ->
      return location.pathname == Meteor.Router[name + 'Path']()

    result = active and 'active'
}