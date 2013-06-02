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

Template.postItem.rendered = ->
  instance = this
  rank = instance.data._rank
  $this = $(this.firstNode)
  postHeight = 80
  newPostition = rank * postHeight

  if typeof instance.currentPosition?
    previousPostion = instance.currentPosition
    delta = previousPostion - newPostition
    $this.css "top", delta + "px"
  else
    $this.addClass "invisible"

  Meteor.defer ->
    instance.currentPosition = newPostition
    $this.css("top", "0px").removeClass "invisible"

Template.postItem.events {
  'click .upvoteable': (event) ->
    event.preventDefault()
    Meteor.call 'upvote', this._id

  'click .disabled': (event) ->
    event.preventDefault()
}