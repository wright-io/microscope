Template.postItem.helpers {
  ownPost: ->
    @userId is Meteor.userId()
	
  domain: ->
    a = document.createElement 'a'
    a.href = this.url
    a.hostname

  upvotedClass: ->
    userId = Meteor.userId()

    if userId and !_.include(this.upvoters, userId)
      'btn-primary upvoteable'
    else
      'disabled'
}

Template.postItem.events {
  'click .upvoteable': (event) ->
    event.preventDefault()
    Meteor.call 'upvote', this._id

  'click .disabled': (event) ->
    event.preventDefault()
}