getSession = -> Session.get('keyword')
@newPostsHandle = Meteor.subscribeWithPagination 'newPosts', getSession, 5
@bestPostsHandle = Meteor.subscribeWithPagination 'bestPosts', getSession, 5

Deps.autorun ->
  # window.newPostsHandle = Meteor.subscribeWithPagination 'newPosts', Session.get('keyword'), 5
  # window.bestPostsHandle = Meteor.subscribeWithPagination 'bestPosts', Session.get('keyword'), 5
  Meteor.subscribe 'singlePost', Session.get('currentPostId')
  Meteor.subscribe 'comments', Session.get('currentPostId')

Meteor.subscribe 'notifications'

