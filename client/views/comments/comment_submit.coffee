Template.commentSubmit.events {
  'submit form': (event, template) ->
    event.preventDefault()

    comment = {
      body: $(event.target).find('[name=body]').val(),
      postId: template.data._id
    }

    Meteor.call 'comment', comment, (error, commentId) ->
      if error? then throwError error.reason
}