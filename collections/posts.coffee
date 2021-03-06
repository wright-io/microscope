@Posts = new Meteor.Collection 'posts'

Posts.allow {
  update: ownsDocument
  remove: ownsDocument
}

Posts.deny {
  update: (userId, post, fieldNames) ->
    _.without(fieldNames,
      'url', 'title', 'street', 'city', 'state', 'zip', 'deal', 'description', 'shortDescription')
      .length > 0
}

Meteor.methods {
  post: (postAttributes) ->
    user = Meteor.user()
    postWithSameLink = Posts.findOne {url: postAttributes.url}

    if !user?
      throw new Meteor.Error 401, "Please sign in to post new stories"

    if !postAttributes.title?
      throw new Meteor.Error 422, "Please fill in a headline"

    if postAttributes.url? and postWithSameLink
      throw new Meteor.Error 302, "This link has already been posted", postWithSameLink._id

    post = _.extend(_.pick(
      postAttributes, 'url', 'title', 'description', 'deal', 'street', 'city', 'state', 'zip'), {
        userId: user._id,
        author: user.username,
        submitted: new Date().getTime()
        shortDescription: postAttributes.description.substr 0, 100
        commentsCount: 0
        upvoters: []
        votes: 0
    })

    postId = Posts.insert post

  upvote: (postId) ->
    user = Meteor.user()

    if !user? then throw new Meteor.Error 401, "Please sign in to upvote"

    Posts.update {_id: postId, upvoters: {$ne: user._id}},
      {$addToSet: {upvoters: user._id}, $inc: {votes: 1}}
}