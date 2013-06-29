Template.header.helpers {
  activeRouteClass: ->
    args = Array.prototype.slice.call arguments, 0
    args.pop()

    active = _.any args, (name) ->
      return location.pathname == Meteor.Router[name + 'Path']()

    result = active and 'active'
}

Template.header.events {
  'submit form': (event) ->
    event.preventDefault()

    Session.set 'keyword', $(event.target).find('[name=keyword]').val()
    console.log "keyword", Session.get 'keyword'
}