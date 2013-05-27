@Comments = new Meteor.Collection 'comments'

Meteor.methods {
  comment: (commentAttributes) ->
    user = Meteor.user()
    post = Posts.findOne commentAttributes.postId

    if !user?
      throw new Meteor.Error 401, "Please sign in to make comments."

    if !commentAttributes.body?
      throw new Meteor.Error 422, "Please write some content for your comment."

    if !commentAttributes.postId?
      throw new Meteor.Error 422, "Comments must be associated with a post."

    comment = _.extend(_.pick(commentAttributes, 'postId', 'body'), {
      userId: user._id
      author: user.username
      submitted: new Date().getTime()
    })

    Comments.insert comment
}