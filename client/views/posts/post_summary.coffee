Template.postSummary.helpers {
  ownPost: ->
    @userId is Meteor.userId()

  upvotedClass: ->
    userId = Meteor.userId()

    if userId and !_.include(this.upvoters, userId)
      'btn-primary upvoteable'
    else
      'disabled'
}

Template.postSummary.events {
  'click .upvoteable': (event) ->
    event.preventDefault()
    Meteor.call 'upvote', this._id

  'click .disabled': (event) ->
    event.preventDefault()
}