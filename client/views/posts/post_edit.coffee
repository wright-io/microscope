Template.postEdit.helpers {
  post: ->
    Posts.findOne Session.get('currentPostId')
}

Template.postEdit.events {
  'submit form': (e) ->
    e.preventDefault()

    currentPostId = Session.get 'currentPostId'

    postProperties = {  
      title: $(e.target).find('[name=title]').val()
      url: $(e.target).find('[name=url]').val()
      street: $(event.target).find('[name=street]').val()
      city: $(event.target).find('[name=city]').val()
      state: $(event.target).find('[name=state]').val()
      zip: $(event.target).find('[name=zip]').val()
      deal: $(event.target).find('[name=deal]').val()
      description: $(e.target).find('[name=description]').val()
      shortDescription: $(e.target).find('[name=description]').val().substr 0, 100
    }

    Posts.update currentPostId, {$set: postProperties}, (error) ->
      if error?
        alert error.reason
      else
        Meteor.Router.to 'postPage', currentPostId

  'click .delete': (e) ->
    e.preventDefault()

    if confirm "Delete this post?"
      currentPostId = Session.get 'currentPostId'
      console.log 'currentPostId: ' + currentPostId
      Posts.remove currentPostId
      Meteor.Router.to 'postsList'
}