@Posts = new Meteor.Collection 'posts'

Posts.allow {
  update: ownsDocument
  remove: ownsDocument
}

Posts.deny {
  update: (userId, post, fieldNames) ->
    _.without(fieldNames, 'url', 'title').length > 0
}

Meteor.methods {
  post: (postAttributes) ->
    console 'fick'
    user = Meteor.user()
    postWithSameLink = Posts.findOne {url: postAttributes.url}

    if !user?
      throw new Meteor.Error 401, "Please sign in to post new stories"

    if !postAttributes.title?
      throw new Meteor.Error 422, "Please fill in a headline"

    if postAttributes.url? and postWithSameLink
      throw new Meteor.Error 302, "This link has already been posted", postWithSameLink._id

    post = _.extend(_.pick(postAttributes, 'url', 'title', 'message'), {
      userId: user._id,
      author: user.username,
      submitted: new Date().getTime()
      commentsCount: 0
      upvoters: []
      votes: 0
    })

    postId = Posts.insert post

  upvote: (postId) ->
    user = Meteor.user()

    if !user? then throw new Meteor.Error 401, "Please sign in to upvote"

    post = Posts.findOne postId

    if !post? then throw new Meteor.Error 422, "Post not found"

    if _.include(post.upvoters, user._id)
      throw new Meteor.Error 422, "You've already voted for this post"

    Posts.update post._id, {$addToSet: {upvoters: user._id}, $inc: {votes: 1}}
}