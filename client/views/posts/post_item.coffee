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